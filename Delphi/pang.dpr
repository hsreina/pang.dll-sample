library pang;

{
	This is just a base project to build pang.dll used in Pangya Server (https://github.com/hsreina/pangya-server)
	You'll not be able to run and play with the server without modification of this project.
}

// Decrypt pangya client packets
function _pangya_client_decrypt(buffin: PAnsiChar; size: Integer; buffout: PPAnsiChar; buffoutSize: PInteger; key: Byte): Integer; cdecl;
begin

	// buffin is the pointer of Data received by the Pangya Client.
	// That mean, when you have a packet from the client, you must give it to this function.
	// This function should only know how to decrypt a single packet

	// You should allocate and decrypt buffin into buffout^ here
  buffout^ := AllocMem(size);
  move(buffin, buffout^, size);
  buffoutSize^ := size;

	// buffout^ is the pointer of the decrypted data starting with the packetId as a WORD

  Result := 1;
end;

// Encrypt Pangya client packets
function _pangya_client_encrypt(buffin: PAnsiChar; size: Integer; buffout: PPAnsiChar; buffoutSize: PInteger; key: Byte; packetId: Byte): Integer; cdecl;
begin

	// buffin start with the PacketId as a WORD + the data in the packet

	// You should allocate and encrypt buffin into buffout^ here
  buffout^ := AllocMem(size);
  move(buffin, buffout^, size);
  buffoutSize^ := size;

	// buffout^ is the pointer of the encrypted data ready to send to Pangya
  Result := 1;
end;

// Decrypt Pangya server packets
function _pangya_server_decrypt(buffin: PAnsiChar; size: Integer; buffout: PPAnsiChar; buffoutSize: PInteger; key: Byte): Integer; cdecl;
begin

	// buffin is the pointer of Data received by the Pangya Server.
	// That mean, when you have a packet from the Server, you must give it to this function.
	// This function should only know how to decrypt a single packet

	// You should allocate and decrypt buffin into buffout^ here
  buffout^ := AllocMem(size);
  move(buffin, buffout^, size);
  buffoutSize^ := size;

 	// buffout^ is the pointer of the decrypted data starting with the packetId as a WORD
  Result := 1;
end;

// Encrypt Pangya server packets
function _pangya_server_encrypt(buffin: PAnsiChar; size: Integer; buffout: PPAnsiChar; buffoutSize: PInteger; key: Byte): Integer; cdecl;
begin

	// buffin start with the PacketId as a WORD + the data in the packet

	// You should allocate and encrypt buffin into buffout^ here
  buffout^ := AllocMem(size);
  move(buffin, buffout^, size);
  buffoutSize^ := size;

	// buffout^ is the pointer of the encrypted data ready to send to Pangya
  Result := 1;
end;

procedure _pangya_free(buffout: PPansiChar); cdecl;
begin
	// This function is used to free allocated buffout
	// It's to keep the Idea, the "class" who allocate should free the memory
	// I don't want to free the buffout from the outside because it as been allocated here
  FreeMem(buffout^);
end;

// Not used for now but maybe one day
function _pangya_deserialize(value: UInt32): UInt32; cdecl;
begin
  Result := value;
end;

exports
  _pangya_client_decrypt, _pangya_client_encrypt, _pangya_server_decrypt, _pangya_server_encrypt, _pangya_free, _pangya_deserialize;

begin

end.
