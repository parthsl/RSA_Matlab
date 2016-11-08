function [b] = powermod(b,e,n)
b = mod(b,n);

residue = [];
r_base=1;

while gt(e,1),
    t = b;
    b = mod(b*b,n);    
    if ne(mod(e,2),0),
        residue(r_base)=t;
        r_base = r_base+1;
        e = e-1;
    end
    e = (e/2);
end

for i=residue,
    b = mod(b*i,n);
end
end