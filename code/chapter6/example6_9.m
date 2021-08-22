%画出双极性NRZ基带信号经带宽受限信号后造成码间干扰影响的眼图，文件eyepattern1.m
N=1000;                 %数字序列长度
N_sample=8;             %每码元抽样点数
Ts=1;                   %码元周期
dt=Ts/N_sample;         %采样间隔
t=0:dt:(N*N_sample-1)*dt;

gt=ones(1,N_sample);    %产生数字基带波形
d=sign(randn(1,N));     %利用随机数生成函数和符号函数生成数字序列
a=sigexpand(d,N_sample);       %扩展输入数字序列，程序文件见后）
st=conv(a,gt);                 %生成数字基带信号

ht1=2.5*sinc(2.5*(t-5)/Ts);    %问题（1）中理想低通H（f)的付立叶变换h(t)
rt1=conv(st,ht1);              %生成输出信号rt1

ht2=sinc((t-5)/Ts);            %问题（2）中理想低通H（f)的付立叶变换h(t)
rt2=conv(st,ht2);              %生成输出信号rt2

eyediagram(rt1+j*rt2,40,5);    %调用MATLAB眼图函数画眼图，每个轨迹40个点，水平轴的坐标范围[-2.5,2.5]