#include <stdio.h>
#include <windows.h>
#include <string.h>

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