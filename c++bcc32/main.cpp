// pang.cpp : Defines the exported functions for the DLL application.
//

/**
	This is just a base project to build pang.dll used in Pangya Server (https://github.com/hsreina/pangya-server)
	You'll not be able to run and play with the server without modification of this project.
*/

#include <Windows.h>
#include <stdlib.h>

#define DLLEXPORT EXTERN_C __declspec(dllexport)

typedef unsigned int UInt32;

// Decrypt pangya client packets
DLLEXPORT int _pangya_client_decrypt(char *buffin, int size, char **buffout, int *buffoutSize, char key) {

	// buffin is the pointer of Data received by the Pangya Client.
	// That mean, when you have a packet from the client, you must give it to this function.
	// This function should only know how to decrypt a single packet

	// You should allocate and decrypt buffin into *buffout here
	*buffout = (char*)malloc(size);
	memmove(*buffout, buffin, size);
	*buffoutSize = size;

	// *buffout is the pointer of the decrypted data starting with the packetId as a WORD
	return 1;
}

// Encrypt Pangya client packets
DLLEXPORT int _pangya_client_encrypt(char *buffin, int size, char **buffout, int *buffoutSize, char key, char packetid) {

	// buffin start with the PacketId as a WORD + the data in the packet

	// You should allocate and encrypt buffin into *buffout here
	*buffout = (char*)malloc(size);
	memmove(*buffout, buffin, size);
	*buffoutSize = size;

	// *buffout is the pointer of the encrypted data ready to send to Pangya
	return 1;
}

// Decrypt Pangya server packets
DLLEXPORT int _pangya_server_decrypt(char *buffin, int size, char **buffout, int *buffoutSize, char key) {

	// buffin is the pointer of Data received by the Pangya Server.
	// That mean, when you have a packet from the Server, you must give it to this function.
	// This function should only know how to decrypt a single packet

	// You should allocate and decrypt buffin into *buffout here
	*buffout = (char*)malloc(size);
	memmove(*buffout, buffin, size);
	*buffoutSize = size;

	// *buffout is the pointer of the decrypted data starting with the packetId as a WORD
	return 1;
}

// Encrypt Pangya server packets
DLLEXPORT int _pangya_server_encrypt(char *buffin, int size, char **buffout, int *buffoutSize, char key) {

	// buffin start with the PacketId as a WORD + the data in the packet

	// You should allocate and encrypt buffin into *buffout here
	*buffout = (char*)malloc(size);
	memmove(*buffout, buffin, size);
	*buffoutSize = size;

	// *buffout is the pointer of the encrypted data ready to send to Pangya
	return 1;
}

DLLEXPORT void _pangya_free(char **buffout) {
	// This function is used to free allocated buffout
	// It's to keep the Idea, the "class" who allocate should free the memory
	// I don't want to free the buffout from the outside because it as been allocated here
	free(*buffout);
}

// Not used for now but maybe one day
DLLEXPORT UInt32 _pangya_deserialize(UInt32 deserialize) {
	return deserialize;
}