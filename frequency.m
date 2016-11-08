function [X,Y] = frequency(text)
frequ = zeros(2,26);
frequ(2,:)= (1:26);

for c=text
    i = int32(c);
    if(i>=65 && i<=90)
        frequ(1,i-64) = frequ(1,i-64)+1;
    else
        if(i>=97 && i<=122)
            frequ(1,i-96) = frequ(1,i-96)+1;
        end
    end
end
[Y,I] = sort(frequ(1,:),'descend');
frequ = frequ(:,I);
Y = frequ(1,:);
max = Y(1);
for i=(1:26)
    Y(i) = Y(i)/max;    
end
X = frequ(2,:);
X = X+[96];
X = cat(2,[0],X);
X = (char(X));

X = num2cell(X);
end