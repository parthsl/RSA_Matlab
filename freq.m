function [] = freq(text,text2)
[X,Y] = frequency(text);
[X,Y2] = frequency(text2);
plot((1:26),Y,'b',(1:26),Y2,'r');
set(gca,'XTickLabel',X,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26]);
end