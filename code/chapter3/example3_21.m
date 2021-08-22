x=linspace(0,2*pi,50);
y1=cos(x);
y2=sin(x);
plot(x,y1,x,y2)
xlabel('x的取值范围')
ylabel('y1和y2的值')
legend(' y1=cos(x)', ' y2=sin(x)')
