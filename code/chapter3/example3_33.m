[x,y]=meshgrid(-8:0.5:8);
z=sqrt(x.^2+y.^2)+eps;
f=sin(z)./z;
mesh(f)            		%绘制由线框构成的表面图形
meshc(f)           		%绘制带有轮廓线的表面图形
meshz(f)           		%绘制带有遮帘线的表面图形
