function y=LPF(x,fm,fs)  % x是输入，y是输出，fm是滤波器截止频率，fs是采样率
n=length(x);
T=n/fs;
f=[-fs/2:1/T:fs/2-1/T];
X=t2f(x,fs);
X(abs(f)>fm)=0;
y=f2t(X,fs);
