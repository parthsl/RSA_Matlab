function [d,e,n] = rsa_keygeneration()
% key generation function to get public and private keys
% RSA is available in 512,124,2048 and 3096
RSA_version = 2048;
% p and q are distinct primes. Both p and q are 32-bit random prime
% integers.
%randseed function takes argument(State,m,n,range_min,range_max), mxn.
p = randseed(1,1,1,1,RSA_version);
q = randseed(1,1,1,1,RSA_version);
while q==p,
    q = randseed;
end

% n is 64-bit integer
n = int64(p)*int64(q);

% calculate phi(n) = (p1)*(q-1)
phi = int64(p-1)*int64(q-1);

% e is choosen such that GCD(phi,e)=1
e = int64(2);
while gcd(phi,e)~=1,
    e = e+1;
end

% selecting d such that (de)mod phi == 1(mod phi)
[g,x,d] = gcd(phi,e);
d = mod(d,phi);
if(d<0),
    d = d+phi;
end
d = int64(d);
end

% public key-->{e,n}
% private keys-->{d,n}