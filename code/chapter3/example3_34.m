m=5;
n=2^m-1;
theta=pi*(-n:2:n)/n;
phi=(pi/2)*(-n:2:n)'/n;
x=cos(phi)*cos(theta);
y=cos(phi)*sin(theta);
z=sin(phi)*ones(size(theta));
f=hadamard(2^m);
surf(x,y,z,f)             		%绘制由多个小面构成的表面图形
axis square               		%图形区域设定为正方形
colormap([0 0 0;1 1 1])   		%将构成图形的小面着色为黑白相间

