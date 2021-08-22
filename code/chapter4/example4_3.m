ts=0.5;
df=1.0;
fs = 1/ts;  %????
n2 = 50/ts;
n1 = fs/df;
N = 2^(max(nextpow2(n1),nextpow2(n2)));
          %????2?????FFT????
df = fs/N;  %?????
t = 0:0.01:50;
y = cos(2/5*pi*t);
subplot(2,2,1);
plot(t,y,'k:');  %??????
hold on
t2=0:ts:50;
y2=cos(2/5*pi*t2);
stem(t2,y2,'k');     % ?????????
axis([0 10 -1.2,1.2]);
title('????: \rm x_{s}(t)');
xlabel('t');
line([0 10],[0 0],'color',[0 0 0]);
hold off

k=-N:N;
w = df*k;
Y = 0.01*y*exp(-j*2*pi*t'*w);% ?? CFT
Y=abs(Y);
subplot(2,2,2);
plot(w,Y,'k');
axis([-fs/2-0.5,fs/2+0.5,0,8*pi+0.5]);
title('???????: X(f)');
xlabel('f');

subplot(2,2,3);
Y1=y2*exp(-j*2*pi*t2'*w); % ?????????
Y1=Y1/fs;
plot(w,abs(Y1),'k');
title('???????? \rm X_{s}(f)');
xlabel('f');
axis([-fs/2-1,fs/2+1,0,8*pi+0.5]);

Y2=fft(y2,N); %??FFT??????????
Y2=Y2/fs;
f=[0:df:df*(N-1)]-fs/2; %??????
subplot(2,2,4);
plot(f,fftshift(abs(Y2)),'k');
axis([-fs/2-0.5,fs/2+0.5,0,8*pi+0.5]);
title('????????\rm X_{s}(f) ');
xlabel('f');
