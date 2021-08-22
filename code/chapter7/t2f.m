% t2f(s,fs).m
function S=t2f(s,fs)  % s代表输入信号，S代表s的频谱，fs是采样率
    N=length(s);  % 总样点数
    T=1/fs*N;  % 观察时间
    f=[ -N/2:(N/2-1)]/T; % 频谱采样点
    tmp1=fft(s)/fs;
    tmp2=N*ifft(s)/fs;
    S(1:N/2)=tmp2(N/2+1:-1:2);
    S(N/2+1:N)=tmp1(1:N/2);
    S=S.*exp(j*pi*f*T);
