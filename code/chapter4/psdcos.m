close all;
fs=800;
ts=1/fs;
t =0:ts:2;
x = cos(2*pi*73*t)+cos(2*pi*21*t);
nfft=64;
power=(norm(x)^2)/length(x+1);
spow=abs(fft(x,nfft).^2);
f=(0:nfft-1)/ts/nfft; %????????????
f=f-fs/2;
plot(f,fftshift(spow),'k','LineWidth',1);
xlabel('????');ylabel('??????');
disp(['power=',num2str(power),'.']);
