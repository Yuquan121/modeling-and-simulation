%白噪声通过理想滤波器
%绘制输出信号的功率谱和自相关函数
FH_L=-2;
FH_R=2;
f=FH_L:0.01:FH_R;
subplot(2,1,1);
plot(f,ones(size(f)),'k');
axis([-2.5,2.5,0,2]);
xlabel('f (单位: Hz)');ylabel(' 功率谱密度 ');
subplot(2,1,2);
t=-5:0.01:5;
R=2*sinc(2*t);
plot(t,R,'k');
xlabel('\tau (单位: Second)');ylabel(' 自相关函数 ');