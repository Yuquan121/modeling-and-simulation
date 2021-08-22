sales=[30 40 55 79 62 81];
x=2001:2006;
profits=[15.5 23.2 28.6 36.9 27.0 42.5];
area(x,sales,'facecolor',[0.5 0.9 0.6],'edgecolor',...
'b','linewidth',2)                    	%设置填充色、边界色和边界宽度
hold on
area(x,profits,'facecolor',[0.9 0.8 0.7],'edgecolor','r','linewidth',2)
hold off
set(gca,'xtick',[2001:2006])         	%x轴为2001到2006
xlabel('年份','fontsize',10)          	%x轴标注字号为10号
ylabel('万元','fontsize',10)
gtext('成本')                            	%通过光标在图形上添加注释
gtext('利润')
gtext('\rightarrow销售额')
