function [out]=sigexpand(d,M)
%将输入的序列扩成间隔为N-1个0的序列
N=length(d);
out=zeros(M,N);
out(1,:)=d;
out=reshape(out,1,M*N);