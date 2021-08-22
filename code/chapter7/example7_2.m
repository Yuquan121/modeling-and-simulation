fs=800;    % 采样速率，单位kHz
T=200;    % 频谱分辨率，单位ms
dt=1/fs;
t=[-T/2:dt:T/2-dt];
df=1/T;
f=[-fs/2:df:fs/2-df];
fm=1;     % 调制信号的频率，单位kHz
fc=10;     % 载波频率，单位kHz
A=3;      % 直流信号
m=cos(2*pi*fm*t)+A;
s=m.*cos(2*pi*fc*t); % 已调信号
y1=abs(hilbert(s))-A;% 进行包络检波，并去掉直流分量
subplot(2,1,1)
plot(t,y1)
title(’AM信号通过理想信道的解调信号’)
ss=awgn(s,20,’measured’);  % AM信号通过AWGN信道，叠加上噪声
y2= abs(hilbert(ss))-A;
subplot(2,1,2)
plot(t,y2)
title(’信噪比为20dB时的解调信号’)
