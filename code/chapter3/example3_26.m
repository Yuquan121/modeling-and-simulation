A=[1 2 3 4
   2 4 6 8
   3 5 7 3
   7 5 3 2
   6 3 2 1];
area(A)                          		%绘制区域
set(gca,'xtick',1:5)             	%设定x轴的标示
grid on                          		%显示网格
set(gca,'layer','top')           	%将网格显示在图形之上
