% f2t(S,fs).m
function s=f2t(S,fs)
    N=length(S);
    T=N/fs;
    t=[-(T/2):1/fs:(T/2-1/fs)];  % 时域采样点
    tmp1=fft(S)/T;
    tmp2=N*ifft(S)/T;
    s(1:N/2)=tmp1(N/2+1:-1:2);
    s(N/2+1:N)=tmp2(1:N/2);
    s=s.*exp(-j*pi*t*fs);
