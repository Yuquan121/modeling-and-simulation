function sigexp(a,s,w,t1,t2)
%本函数实现绘制复指数信号时域波形
% a : 复指数信号幅度
% s : 复指数信号频率实部
% w : 复指数信号频率虚部
% t1,t2： 绘制波形的时间范围
t = t1:0.01:t2;
theta = s + j*w;
fc = a*exp(theta*t);
real_fc = real(fc);
imag_fc = imag(fc);
mag_fc = abs(fc);
phase_fc = angle(fc);

subplot(2,2,1)
plot(t,real_fc,'k')
title('实部');xlabel('t');
axis([t1,t2,-(max(mag_fc)+0.2),max(mag_fc)+0.2]);
subplot(2,2,2)
plot(t,imag_fc,'k');
title('虚部');xlabel('t');
axis([t1,t2,-(max(mag_fc)+0.2),max(mag_fc)+0.2]);
subplot(2,2,3)
plot(t,mag_fc,'k');
title('模');xlabel('t');
axis([t1,t2,0,max(mag_fc)+0.5]);
subplot(2,2,4)
plot(t,phase_fc,'k');
title('相角');xlabel('t');
axis([t1,t2,-(max(phase_fc)+0.5),max(phase_fc)+0.5]);