fs=800;    % 采样速率，单位kHz
T=200;    % 频谱分辨率，单位ms
dt=1/fs;
t=[-T/2:dt:T/2-dt];
df=1/T;
f=[-fs/2:df:fs/2-df];
fm=2;     % 调制信号的频率，单位kHz
fc=20;     % 载波频率，单位kHz
m=cos(2*pi*fm*t);
s=m.*cos(2*pi*fc*t);  % DSB已调信号
y=s.*cos(2*pi*fc*t); % 相干解调
y1=LPF(y,30,fs);    % 相干解调后通过低通滤波器,滤波器截止频率为30KHz
subplot(2,1,1)
plot(t,y1)
title('DSB信号通过理想信道的解调信号')
axis([-2,2,-1,1])    % 设置图形观察范围
ss=awgn(s,20,'measured'); % DSB信号通过AWGN信道，叠加上噪声
yy=ss.*cos(2*pi*fc*t); % 相干解调
y2=LPF(yy,30,fs);    % 相干解调后通过低通滤波器,滤波器截止频率为30KHz
subplot(2,1,2)
plot(t,y2)
title('信噪比为20dB时的解调信号')
axis([-2,2,-1,1])    %设置横轴观察范围为-2到2，纵轴的观察范围为-1到1
