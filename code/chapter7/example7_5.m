fs=800;
T=16;
dt=1/fs;
t=[-T/2:dt:T/2-dt];
df=1/T;
f=[-fs/2:df:fs/2-df];
fm=1;
Kf=10;
fc=20;
m=cos(2*pi*fm*t);
phi=2*pi*Kf*cumsum(m)*dt; %对调制信号做积分运算
s=cos(2*pi*fc*t+phi);  %FM已调信号
S=t2f(s,fs);
figure(1)
plot(t,s)  % 画出已调信号的波形
axis([0,1,-1,1])
figure(2)
plot(f,abs(S).^2)   % 画出已调信号的功率谱
axis([-40,40,0,max(abs(S).^2)])  % 观察双边带功率谱
