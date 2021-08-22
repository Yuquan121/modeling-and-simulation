x=-10:0.1:10;          	% 定义图形的横轴坐标范围及采样步长
x=x+(x==0)*eps;        	% 用一个“机器0”小数代替0 
y=sin(x)./x;           	% 用可逻辑运算的sin(esp)/esp近似代替sin(0)/0的极限
plot(x,y)
xlabel('x')           	% 在x轴上标注x
ylabel('y=sinx/x')   	% 在y轴上标注y=sinx/x
title('门函数的频谱')  	% 在图形上方添加标题
