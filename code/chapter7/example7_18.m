snr=10;      %信噪比，单位为dB 
fftl=128;    %FFT的长度
N=6;         %一个帧结构中OFDM信号的个数
para=128;    %并行传输的子载波个数
gsl=32;      %保护时隙的长度
%**************OFDM信号的产生***************
signal=rand(1,para*N*2)>0.5;
%产生0、1随机序列，符号个数为para*N*2（子信道数*调制水平*每个子信道中符号数）
for i=1:para
    for j=1:N*2
    sigpara(i,j)=signal(i*j);
%串并变换，将随机产生的二进制矩阵变换为行数为para，列数为N*2的矩阵
end
end
%*******以下进行QPSK调制，将数据分为I、Q两路********
for j=1:N;
    ich(:,j)=sigpara(:,2*j-1);
    qch(:,j)=sigpara(:,2*j);
end
kmod=1./sqrt(2);
ich1=ich.*kmod;
qch1=qch.*kmod;
x=ich1+qch1.*sqrt(-1);     %产生复信号
y=ifft(x);                 %傅里叶反变换将频域信号转换为时域信号
ich2=real(y);              %I信道取时域信号的实部
qch2=imag(y);              %Q信道取时域信号的虚部
%**********以下插入保护时隙**********
ich3=[ich2(fftl-gsl+1:fftl,:);ich2];
qch3=[qch2(fftl-gsl+1:fftl,:);qch2];
%**********以下进行并串变换**********
ich4=reshape(ich3,1,(fftl+gsl)*N);
qch4=reshape(qch3,1,(fftl+gsl)*N);
%以下为系统发送端形成的信号
Tdata=ich4+qch4.*sqrt(-1);
%**********以下为系统接收端进行解调的过程**********
Rdata=awgn(Tdata,snr,'measured');   %对接收到的信号加入高斯白噪声
%**********以下为接收端移去保护时隙**********
idata=real(Rdata);
qdata=imag(Rdata);
idata1=reshape(idata,fftl+gsl,N);
qdata1=reshape(qdata,fftl+gsl,N);
idata2=idata1(gsl+1:gsl+fftl,:);
qdata2=qdata1(gsl+1:gsl+fftl,:);
%**********以下为系统接收端进行傅里叶变换**********
Rx=idata2+qdata2+sqrt(-1);
ry=fft(Rx);
Rich=real(ry);
Rqch=imag(ry);
Rich=Rich/kmod;
Rqch=Rqch/kmod;
%**********以下为接收端进行QPSK解调**********
for j=1:N;
    Rpara(:,2*j-1)=Rich(:,j);
    Rpara(:,2*j)=Rqch(:,j);
end
Rsig=reshape(Rpara,1,para*N*2);
Rsig=Rsig>0.5;   %抽样判决
figure(1)
subplot(2,1,1)
stem(Rsig(1:20))
grid;
subplot(2,1,2)
stem(signal(1:20))
grid;	 
