#include <stdio.h>
#include <windows.h>
#include <string.h>

#include<curl/curl.h>
//#include<sys/ioctl.h>
#include<jansson.h>

#define BUFFER_SIZE (256 * 1024)
#define MIDSTATE_SIZE 32
#define DATA_SIZE 128
#define DATA_LENGTH 256

const char *req = "{\"id\": \"1\", \"method\": \"getwork\",\"params\": []}\n";
const char *usr = "priyab.worker1";
const char *pwd = "priya";
const char *pool_url = "http://192.168.1.12:8332";
unsigned char nonce[4] = "1234";
char current_data[DATA_LENGTH];
unsigned char header_buffer[160];
// = "deadbee14cc2c57c7905fd399965282c87fe259e7da366e035dc087a0000141f000000006427b6492f2b052578fb4bc23655ca4e8b9e2b9b69c88041b2ac8c771571d1be4de695931a2694217a00110e000000800000000000000000000000000000000000000000000000000000000000000000000000000000000080020000\0";

char* request(char* url, char* bin_data);

int main()
{
	printf("hello world!\n");
	int i;
	char input;
	char *port = "COM5";
	DCB dcbSerialParams = {0};
	COMMTIMEOUTS timeouts = {0};

	unsigned char bytes_received[4];
	unsigned char bytes_to_send[4];

	/////////////////////////

	request_and_write_work(pool_url);

	////////////////////////
	//for(i=0; i<64;i++)
		//bytes_to_send[i] = i;
	//bytes_to_send[0]=1;
	//bytes_to_send[1]=2;
	//bytes_to_send[2]=3;
	//bytes_to_send[3]=4;

	HANDLE hSerial;
    hSerial = CreateFile(
                port, GENERIC_READ|GENERIC_WRITE, 0, NULL,
                OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL );
	if (hSerial == INVALID_HANDLE_VALUE)
    {
            fprintf(stderr, "Error\n");
			//printf("%s", GetLastError());
            return 1;
    }
    else fprintf(stderr, "OK\n");

	dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
    if (GetCommState(hSerial, &dcbSerialParams) == 0)
    {
        fprintf(stderr, "Error getting device state\n");
        CloseHandle(hSerial);
        return 1;
    }

    dcbSerialParams.BaudRate = CBR_9600;
    dcbSerialParams.ByteSize = 8;
    dcbSerialParams.StopBits = ONESTOPBIT;
    dcbSerialParams.Parity = NOPARITY;
    if(SetCommState(hSerial, &dcbSerialParams) == 0)
    {
        fprintf(stderr, "Error setting device parameters\n");
        CloseHandle(hSerial);
        return 1;
    }
	    // Set COM port timeout settings
    timeouts.ReadIntervalTimeout = 50;
    timeouts.ReadTotalTimeoutConstant = 50;
    timeouts.ReadTotalTimeoutMultiplier = 10;
    timeouts.WriteTotalTimeoutConstant = 50;
    timeouts.WriteTotalTimeoutMultiplier = 10;
    if(SetCommTimeouts(hSerial, &timeouts) == 0)
    {
        fprintf(stderr, "Error setting timeouts\n");
        CloseHandle(hSerial);
        return 1;
    }
	// Send specified text (remaining command line arguments)
    DWORD bytes_written, total_bytes_written = 0;
    fprintf(stderr, "\nSending bytes...%d", header_buffer[0]);

	while(1)
	{
    if(!WriteFile(hSerial, bytes_to_send, 64, &bytes_written, NULL))
    {
        fprintf(stderr, "Error\n");
        CloseHandle(hSerial);
        return 1;
    }
	input = getchar();
	if (input == 'e')
		break;
	bytes_to_send[0] = bytes_to_send[0] + 1;
	bytes_to_send[1] = bytes_to_send[1] + 1;
	bytes_to_send[2] = bytes_to_send[2] + 1;
	bytes_to_send[3] = bytes_to_send[3] + 1;
	}

	DWORD numBytesRead;

    numBytesRead = 0;
	fprintf(stderr, "bytes received\n");
    while (1)
    {
      ReadFile(hSerial,           // handle of file to read
               bytes_received,            // store read data here
               sizeof(bytes_received),    // number of bytes to read
               &numBytesRead,           // pointer to number of bytes actually read
               NULL);
	fprintf(stderr, "%d\t", bytes_received[0]);
	fprintf(stderr, "%d\t", bytes_received[1]);
	fprintf(stderr, "%d\t", bytes_received[2]);
	fprintf(stderr, "%d\t", bytes_received[3]);
	input = getchar();
	if(input == 'e')
		break;
    }

	fprintf(stderr, "%d bytes written\n", bytes_written);

    // Close serial port
    fprintf(stderr, "Closing serial port...");
    if (CloseHandle(hSerial) == 0)
    {
        fprintf(stderr, "Error\n");
        return 1;
    }
    fprintf(stderr, "OK\n");
	
	//////////////////////////////////

	printf("Submitting nonce ....\n");
	submit_nonce(current_data);

	/////////////////////////////////

    // exit normally
    return 0;
}

struct write_result{
	char *data;
	int pos;
	};

size_t write_response(void *ptr, size_t size, size_t nmemb, void *stream)
{
	struct write_result *result = (struct write_result *) stream;
	memcpy( result->data + result->pos, ptr, size*nmemb);
	result->pos += size*nmemb;
	return size*nmemb;
}

unsigned char nibblefromchar(char c)
{
	if( c>= '0' && c <= '9') return c -'0';
	if( c>= 'a' && c <= 'f') return c-'a' +10;
	if( c>= 'A' && c <= 'F') return c - 'A'+10;
	return 255;
}

unsigned char* hexStringToBytes(unsigned char* inhex)
{
	unsigned char *retval;
	unsigned char *p;
	int i, len;

	len = strlen(inhex)/2;
	retval = malloc(len+1);
	for(i=0, p=(unsigned char*) inhex; i<len; i++)
	{
		retval[i] = (nibblefromchar(*p) << 4| nibblefromchar(*(p+1)));
		p+=2;
	}
	retval[len] =0;
	return retval;


}

void submit_nonce(char *arg)
{

	char *proof_resp;
	const json_t *json_setup, *json_resp, *result=NULL;
	json_error_t json_error;
	char nonce_hex[8] ="efefefef";
	char submitreq[100];

	//sprintf(nonce_hex, "%02x%02x%02x%02x", nonce[0], nonce[1], nonce[2], nonce[3]);
	strncpy((char*)arg+152, nonce_hex, 8);
	//json_setup = json_pack_ex(&json_error,0,"{ss,s[s],si}", "method", "getwork", "params", (char *)arg, "id", 1);
	//json_setup = json_pack_ex(&json_error,0,"i",42);

	//if(!json_setup)
		//printf("json setup error while submitting nonce\n");


	sprintf(submitreq, "{\"id\": \"1\", \"method\": \"getwork\",\"params\": [\"%s\"]}\n",arg);
	printf("%s", submitreq);
	proof_resp = request(pool_url, submitreq);
	if(!proof_resp)
		printf("submit nonce response failed\n");

	printf("Proof resp %s", proof_resp);
	/*json_resp = json_loads(proof_resp, 0 , &json_error);

	if (!json_resp)
		printf("Error in json response while submitting nonce\n");

	result = json_object_get(json_resp, "result");
	json_decref(json_resp);
	printf("Result %d", json_string_value(result));*/

	//printf("submit response %s", proof_resp);

}

void request_and_write_work(char* url)
{
	char* init_resp;
	json_t *json_resp;
	json_error_t json_error;
	json_t *data= NULL, *midstate = NULL, *result = NULL;

	init_resp = request(url, req);

	if(!init_resp)
		printf ("Initial response fails");
	json_resp = json_loads(init_resp, 0, &json_error);

	if(!json_resp)
		printf("json load failure");
	result = json_object_get(json_resp, "result");
	data = json_object_get(result, "data");
	midstate = json_object_get(result, "midstate");

	if(!data || !midstate)
		printf("Data or midstate empty");
		printf("INit response %s", init_resp);

	memcpy(current_data, init_resp+188, DATA_LENGTH);

	unsigned char* databytes =  hexStringToBytes(json_string_value(data));
	unsigned char* midstatebytes = hexStringToBytes(json_string_value(midstate));

	memcpy(header_buffer, midstatebytes, MIDSTATE_SIZE);
	memcpy(header_buffer+MIDSTATE_SIZE, databytes, DATA_SIZE);
	int i;
	for(i=0 ; i< 160; i++)
	printf("%d \t", header_buffer[i]);
}

char* request(char* url, char* bin_data)
{
	CURL *curl = NULL;
	CURLcode status;
	struct curl_slist *headers = NULL;
	char *data = NULL;
	long code;

	curl_global_init(CURL_GLOBAL_ALL);
	curl = curl_easy_init();
	if(!curl)
		printf("curl init error \n");

	data = malloc(BUFFER_SIZE);
	if (!data)
		printf("malloc error \n");

	struct write_result write_result = {
		.data = data,
		.pos = 0
	};

	curl_easy_setopt (curl, CURLOPT_URL, url);
	curl_easy_setopt (curl, CURLOPT_POSTFIELDS, ((void*) bin_data));
	//curl_easy_setopt (curl, CURLOPT_POSTFIELDSIZE, ((long) -1));
	curl_easy_setopt (curl, CURLOPT_USERPWD, usr);
	curl_easy_setopt (curl, CURLOPT_HTTPHEADER, headers);
	curl_easy_setopt (curl, CURLOPT_WRITEFUNCTION, write_response);
	curl_easy_setopt (curl, CURLOPT_WRITEDATA, &write_result);

	status = curl_easy_perform(curl);

	if(status != 0)
	{
		printf("Unable to request data %s\n", curl_easy_strerror(status));
	}

	curl_easy_cleanup(curl);
	curl_global_cleanup();
	data[write_result.pos] = '\0';
	return data;
}

