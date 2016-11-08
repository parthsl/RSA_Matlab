clear;
clc;
fileid = fopen('input.txt','r');
text = fgetl(fileid);
fclose(fileid);
%Alice public and private key generation
[ad,ae,an] = rsa_keygeneration();
%Bob public and private key generation
[bd,be,bn] = rsa_keygeneration();

disp('Original Message Alice Wants to send:');
disp(text);
disp('----------Alice creates Digital Signature--------------');
sign = rsa_crypt(text,ae,an);
disp('Digital Signature: ');
fprintf('%x ',sign);
fprintf('\n');

disp('----------------Alice Transfers Message------------------');
fprintf('%08d',length(text)); %length of message
fprintf('%s ',text);    %appended text
fprintf('%x ',sign);    %appended digital signature
fprintf('\n');
disp('---------Bob Verifies Message with Alice public key------------');
sign = rsa_crypt(text,ae,an);
disp('Signature mathcing with provided text.-->Verified text');
disp('----------------------------------------------------------------');