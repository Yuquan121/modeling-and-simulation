Ts=1;                                       %码元周期
%生成理想奈奎斯特脉冲y1=sinc(t/Ts)及它的相邻脉冲y2=sinc((x-Ts)/Ts)
x = linspace(-5,5,1000);
y1 = sinc(x/Ts);
y2=sinc((x-Ts)/Ts);
f=linspace(-(Ts+1),Ts+1);                        %生成矩形传输函数
y=Ts.*rectpuls(f,Ts);
subplot(221)                                            %画图
plot(x,y1,x,y2)subplot(222)
plot(f,y);
axis([-(Ts+.2),Ts+.2,0,Ts+0.2]);

