function y=gausamp(my,Cy)
% 生成高斯过程样本
% my: 均值列向量
% Cy: 方差矩阵
x = bmgauss(0,1,length(my));% 产生高斯随机序列
y = x*sqrtm(Cy)'+my';
