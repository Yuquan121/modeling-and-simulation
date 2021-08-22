t=(0:127)/128*2*pi;
x=cos(t);
y=sin(t);
z=(abs(fft(ones(10,1),128)));
stem3(x,y,z,'o')
xlabel('实部')     				%在x轴标注“实部”
ylabel('虚部')     				%在y轴标注“虚部”
zlabel('幅值')     				%在z轴标注“幅值”
title('频率响应')  				%在图形上方标注标题
