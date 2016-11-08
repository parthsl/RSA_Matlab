clear;
clc;
fileid = fopen('input.txt','r');
plain = fgetl(fileid);
fclose(fileid);

disp('-----------------------Original Message----------------------');
disp(plain);

disp('-----------------------Key Generation----------------------');
[d,e,n] = rsa_keygeneration();
fprintf('Generated keys:\n e=%d,\n d=%d,\n n=%d\n',e,d,n);

disp('------------------------Encryption-------------------------');
c = rsa_crypt(plain,e,n);
fprintf('Cipher Text in Hex: ');
for i=c,
    fprintf('%x ',i);
end
disp(' ');

disp('-------------------------Decryption------------------------');
plain = rsa_crypt(c,d,n);
fprintf(' Plain Text: %s\n',plain);


% Below code if for plotting graph of plain text --> cipher text. 

disp('------------------------GRPAH-------------------------------');
disp('----BLUE=PlainText----------------------RED=CipherText------');
temp = [];
for i=(1:length(c)),
    temp(i) = mod(c(i),26)+97;
end
freq(temp,plain);