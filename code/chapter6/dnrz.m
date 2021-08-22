function y=snrz(x)
%本函数实现将输入的一段二进制代码编为相应的双极性非归零码输出
%输入x为二进制码，输出y为编好的码

t0=300;
t=0:1/t0:length(x);
for i=1:length(x),
    if(x(i)==1),
        for j=1:t0,
            y((i-1)*t0+j)=1;
        end
    else
        for j=1:t0,
            y((i-1)*t0+j)=-1;
        end
    end;
end
y=[y,x(i)];
M=max(y);
m=min(y);
subplot(211)
plot(t,y);grid on;
axis([0,i,m-0.1,M+0.1]);
