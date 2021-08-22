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
S=t2f(s,fs);   % 对已调信号做傅里叶变换
figure(1)
plot(t,s)   
axis([0,1,-1,1])
figure(2)    
plot(f,abs(S))       % 画出已调信号的双边带幅度谱
axis([-30,30,0,max(abs(S))])   %设置横、纵轴的观察范围
