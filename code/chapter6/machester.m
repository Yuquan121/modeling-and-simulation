function y=machester(x)
%本函数实现将输入的一段二进制代码编为相应的数字双相码输出
%输入x为二进制码，输出y为编好的码
t0=300;
t=0:1/t0:length(x);                   %定义对应的时间序列
for i=1:length(x)                     %进行码型变换
    if(x(i)==1)                       %若输入信息为1
        for j=1:t0/2
            y(t0/2*(2*i-2)+j)=0;      %定义前半时间值为0
            y(t0/2*(2*i-1)+j)=1;      %定义后半时间值为1
        end
    else
        for j=1:t0/2                  %反之，输入信息为0
           y(t0/2*(2*i-2)+j)=1;       %定义前半时间值为1
           y(t0/2*(2*i-1)+j)=0;       %定义后半时间值为0
        end
    end
end
y=[y,x(i)];                           %给序列y加上最后一位，便于作图
M=max(y);
m=min(y);
subplot(211)
plot(t,y);
axis([0,i,m-0.1,M+0.1]);
grid on;