#include <stdio.h>
#include <windows.h>
#include <string.h>

#include<curl/curl.h>
//#include<sys/ioctl.h>
#include<jansson.h>

#define BUFFER_SIZE (256 * 1024)
#define MIDSTATE_SIZE 32
#define DATA_SIZE 128

const char *req = "{\"id\": \"1\", \"method\": \"getwork\",\"params\": []}\n";
const char *usr = "priyab.worker1";
const char *pwd = "priya";
const char *pool_url = "http://192.168.1.12:8332";


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
		//bytes_to_send[i] = 64-i;
	bytes_to_send[0]=1;
	bytes_to_send[1]=2;
	bytes_to_send[2]=3;
	bytes_to_send[3]=4;

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

	// Send specified text (remaining command line arguments)
    DWORD bytes_written, total_bytes_written = 0;
    fprintf(stderr, "\nSending bytes...");

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

    fprintf(stderr, "%d bytes written\n", bytes_written);


    // Close serial port
    fprintf(stderr, "Closing serial port...");
    if (CloseHandle(hSerial) == 0)
    {
        fprintf(stderr, "Error\n");
        return 1;
    }
    fprintf(stderr, "OK\n");
	
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

	unsigned char* databytes =  hexStringToBytes(json_string_value(data));
	unsigned char* midstatebytes = hexStringToBytes(json_string_value(midstate));

	unsigned char header_buffer[160];
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

