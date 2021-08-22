x1=0.5;x2=0.1;
t=0:50;
y=sin(x1*t).*exp(-x2*t);
stem(t,y)
