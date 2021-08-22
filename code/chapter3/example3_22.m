x=0:0.1:10;
y=exp(x);
subplot(1,3,1)    		% 显示在第1个子图上
plot(x,y)
subplot(1,3,2)
loglog(x,y)       		% 在x轴和y轴都按对数比例绘制图形
subplot(1,3,3)
semilogy(x,y)     		% 在x轴按线性比例、y轴按对数比例绘制二维图形
