t=0:pi/50:20*pi;
x=sin(t);
y=cos(2*t);
z=sin(t)+cos(t);
plot3(x,y,z,'-rd')  	%绘制的函数曲线为红色实线，数据点用菱形表示
