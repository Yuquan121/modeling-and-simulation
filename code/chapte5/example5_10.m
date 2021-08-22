% example5_10
clear all
close all
dx=0.01;
x=-1:dx:1;
u=255;
A=87.6;
% u Law
yu=sign(x).*log(1+u*abs(x))/log(1+u);
% A Law
for i=1:length(x)
if abs(x(i))<1/A
ya(i)=A*x(i)/(1+log(A));
else
ya(i)=sign(x(i))*(1+log(A*abs(x(i))))/(1+log(A));
end
end
figure(1)
plot(x,yu,'k.:','LineWidth',1.5)
title('\mu Law')
xlabel('x')
ylabel('y')
grid on
hold on
xx=[-1,-127/255,-63/255,-31/255,-15/255,-7/255,-3/255,-1/255,1/255,3/255,7/255,15/255,31/255,63/255,127/255,1];
yy=[-1,-7/8,-6/8,-5/8,-4/8,-3/8,-2/8,-1/8,1/8,2/8,3/8,4/8,5/8,6/8,7/8,1];
plot(xx,yy,'r','LineWidth',1.5)
stem(xx,yy,'b-.','LineWidth',1,'MarkerSize',10)
legend('\mu Law compression','the broken-line approximation of \mu Law','Location','southeast')
figure(2)
plot(x,ya,'k.:','LineWidth',1.5)
title('A Law')
xlabel('x')
ylabel('y')
grid on
hold on
xx=[-1,-1/2,-1/4,-1/8,-1/16,-1/32,-1/64,-1/128,1/128,1/64,1/32,1/16,1/8,1/4,1/2,1];
yy=[-1,-7/8,-6/8,-5/8,-4/8,-3/8,-2/8,-1/8,1/8,2/8,3/8,4/8,5/8,6/8,7/8,1];
plot(xx,yy,'r','LineWidth',1.5)
stem(xx,yy,'b-.','LineWidth',1,'MarkerSize',10)
legend('A Law compression','the broken-line approximation of A Law','Location','southeast')
