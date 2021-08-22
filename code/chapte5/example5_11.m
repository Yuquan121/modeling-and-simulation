%example5_11
clear all
close all

x=+1270;
if x>0
out(1)=1;
else
out(1)=0;
end

if abs(x)>=0 & abs(x)<16
out(2)=0; out(3)=0; out(4)=0; step=1; st=0;
elseif 16<=abs(x) & abs(x)<32
out(i,2)=0; out(3)=0; out(4)=1; step=1; st=16;
elseif 32<=abs(x) & abs(x)<64
out(2)=0; out(3)=1; out(4)=0; step=2; st=32;
elseif 64<=abs(x) & abs(x)<128
out(2)=0; out(3)=1; out(4)=1; step=4; st=64;
elseif 128<=abs(x) & abs(x)<256
out(2)=1; out(3)=0; out(4)=0; step=8; st=128;
elseif 256<=abs(x) & abs(x)<512
out(2)=1; out(3)=0; out(i,4)=1; step=16; st=256;
elseif 512<=abs(x) & abs(x)<1024
out(2)=1; out(3)=1; out(i,4)=0; step=32; st=512;
elseif 1024<=abs(x) & abs(x)<2048
out(2)=1; out(3)=1; out(4)=1; step=64; st=1024;
else
out(2)=1; out(3)=1; out(4)=1; step=64; st=1024;
end

if(abs(x)>=2048)
out(2:8)=[1 1 1 1 1 1 1];
else
tmp=floor((abs(x)-st)/step);
t=dec2bin(tmp,4)-48; % ??dec2bin ????ASCII ????48 ??0
out(5:8)=t(1:4);
end

out=reshape(out,1,8)
