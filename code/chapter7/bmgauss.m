function [y1,y2]=bmgauss(m,sigma,N)
% 产生高斯随机数的Box-Muller算法
% 调用格式   
% [y1,y2] = bmgauss(m,sigma,N) ：输出期望为m，方差为sigma的两个高斯随机序列
% [y1,y2] = bmgauss(m,sigma)：输出期望为m，方差为sigma的两个高斯随机数
% [y1,y2] = bmgauss(sigma): 输出期望为0，方差为sigma的两个高斯随机数
% [y1,y2] = bmgauss：输出期望为0，方差为1的两个高斯随机数
if nargin == 0,
  m=0; sigma=1;N=1;
elseif nargin == 1,
  sigma=m; m=0;N=1;
elseif nargin ==2,
    N=1;
end;
u1 = rand(1,N);
u2 =rand(1,N);
r = sigma*sqrt(-2*log(u1)); % 瑞利分布
y1 = m+r.*cos(2*pi*u2);
y2 = m+r.*sin(2*pi*u2);