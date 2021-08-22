echo off
B=1;    % 设置仿真带宽
fs=4*B;     % 抽样频率
ts = 1/fs; 
Nfft=128;   % 设置FFT点数目
AVG=50;     
sigma=sqrt(fs); 
t =0:ts:1024;
N = length(t);
s1 = cos(t);
psd_s1 = abs(fft(s1,Nfft).^2)/(N+1); %输入:确定性信号功率谱密度
psd_n1=zeros(1,Nfft);
psd_x = zeros(1,Nfft);
for j=1:AVG
    n1=sigma*randn(1,N);
    x = s1+n1;
    psd_n1 = psd_n1+abs(fft(n1,Nfft).^2)/(N+1); %输入:噪声功率谱密度
    psd_x = psd_x+abs(fft(x,Nfft).^2)/(N+1);  % 输入信号功率谱密度
end
psd_n1 = psd_n1/AVG;
psd_x = psd_x/AVG;
f=(0:length(psd_s1)-1)/ts/length(psd_s1); %设置频率范围
f=f-fs/2;
Hf2=1./(1+(2*pi*f).^2);
subplot(3,1,1);
psd_s2 = Hf2.*fftshift(psd_s1); %输出：确定性信号功率谱密度
plot(f,psd_s2,'k');
axis([-1,1,0,1]);
xlabel('f');ylabel('功率谱密度(确定信号)');
subplot(3,1,2);
psd_n2 = Hf2.*fftshift(psd_n1); %输出:噪声功率谱密度
plot(f,psd_n2,'k');
axis([-1,1,0,0.2]);
xlabel('f');ylabel('功率谱密度(噪声信号)');
subplot(3,1,3);
psd_x2 = Hf2.*fftshift(psd_x); % 输出信号功率谱密度
plot(f,psd_x2,'k');
xlabel('f');ylabel('功率谱密度(输出信号）');
axis([-1,1,0,1]);
SNR=trapz(f,psd_s2)/trapz(f,psd_n2); %数值求解信噪比
text = ['输出信噪比:  ',num2str(SNR,15),'.'];
disp(text);
