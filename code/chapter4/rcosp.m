N = 1024;
AVG=50;
maxlags=64;           %延迟
nfft=512;             %频率估计数目
Rx_m = zeros(1,2*maxlags+1);
Px_m = zeros(1,maxlags);
Sx_m=zeros(1,nfft);
n = 0:N-1;
t = n/maxlags;
for j = 1:AVG
    X = cos(2*pi*10*t+ 2*pi*rand);
    Sx_m = Sx_m+abs(fft(X,nfft).^2)/nfft; % 功率谱估计
    [Rx,lags]=xcorr(X,maxlags,'unbiased'); % 自自相关函数计算
    Px = fftshift(abs(fft(Rx(1:maxlags))));% 对相关函数进行FFT变换求功率谱
    Rx_m = Rx_m+Rx;
    Px_m = Px_m + Px;
end
Rx_m = Rx_m/AVG;
Sx_m = Sx_m/AVG;
Px_m = Px_m/AVG;
subplot(3,1,1);
plot(2*pi*lags/maxlags,Rx_m,'k');
xlabel('时间间隔 (单位:2\pi \tau)');ylabel('自相关函数');
title('自相关函数');
axis([-2*pi,2*pi,-1.2,1.2]);
subplot(3,1,2);
df=maxlags/(nfft);                 %分辨率
fr = [0:df:df*(nfft-1)]-maxlags/2;
stem(fr,fftshift(Sx_m/max(Sx_m)),'.k');
axis([-20,20,0,1.2]);
xlabel('频率');ylabel('功率谱(PSD)');
title('功率谱: 周期图计算PSD')
subplot(3,1,3);
df = 1;                            %分辨率
freq=[0:df:(maxlags-1)]-maxlags/2;
stem(freq,Px_m/max(Px_m),'ok');
axis([-20,20,0,1.2]);
xlabel('频率');ylabel('功率谱(PSD)');
title('功率谱: 对相关函数做傅立叶变换')