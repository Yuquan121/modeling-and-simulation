x=0:0.01:5;
y=sin(pi*x);            %根据推导出的算式计算单极性非归零码的功率谱
y=y./(pi*x);
y(1)=1;
snrzgonglv=y.*y;
snrzgonglv=snrzgonglv/4;
y=sin(pi*x/2);          %计算数字双相码的功率谱
y=y./(pi*x/2);
y(1)=1;
machegonglv=sin(pi*x/2).*sin(pi*x/2);
machegonglv=machegonglv.*y;
machegonglv=machegonglv.*y;
x=x*pi;
milergonglv=(23-2*cos(x)-22*cos(2*x)-12*cos(3*x)+5*cos(4*x)+12*cos(5*x)+...
+2*cos(6*x)-8*cos(7*x)+2*cos(8*x))./(17+8*cos(8*x));
t=x.*x;
milergonglv=milergonglv./t;
milergonglv(1)=0.2;
x=x/pi;
plot(x,snrzgonglv,'--',x,machegonglv,':',x,milergonglv); %作图
legend('snrzgonglv','machegonglv','milergonglv');    %在图形界面的右上角绘制图中各条曲线的图例