x=0:0.1:10;
y=sin(x);
plot(x,y)
xlabel('x')
ylabel('y=sinx')
text(0,sin(0),'\leftarrowsin(x)=0')    % 在指定位置添加左箭头及字符串
text(3*pi/4,sin(3*pi/4),'\rightarrowsin(x)=0.707')
text(7*pi/4,sin(7*pi/4),'\leftarrowsin(x)=-0.707')
