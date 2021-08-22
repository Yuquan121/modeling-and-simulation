% 2进制随机信号产生
% 利用FFT计算随机信号的功率谱和自相关函数
PN_coff = [0 1 1 1 0 0 0 1];  % 连接向量
PN_seed = [1 0 1 0 0 1 0 1]; %设置初始向量
nbits = 2^8-1;
P = zeros(1,nbits);     %最大周期为2^8-1
samp = 5;		%采样频率
PN_reg = PN_seed;
for i = 1:nbits
    P(((i-1)*samp+1):((i-1)*samp+samp)) = PN_reg(1);
    f = rem(PN_reg*PN_coff',2); % 模2加法器
    PN_reg = [f,PN_reg(1:1:7)]; % 反馈
end 
t1=0:100;
subplot(3,1,1);
stem(t1,P(1:101),'.k');
ylabel('随机2进制序列');
axis([0 100 -1.5 1.5]);
T = nbits*samp;
P = 2*P-1;  % 输出电平为+/-
x = fft(P);             %用FFT计算频谱
psd = x.*conj(x);       %计算PSD
Rx = real(ifft(psd))/T;   %计算自相关函数
psd = abs(psd)/T;
df = samp/T;
freq=[0:df:df*(length(x)-1)]-samp/2;
subplot(3,1,2);
plot(freq,fftshift(psd),'.k');
ylabel('随机序列功率谱');
subplot(3,1,3);
stem(t1,Rx(1:101),'.k');
ylabel('自相关函数');
