[x,y,z]=sphere(30);      
surf(x,y,z)             		%绘制三维单位球面
shading interp           	%采用插补明暗处理
hold on
x1=2*x;
y1=2*y;
z1=2*z;
mesh(x1,y1,z1)           	%绘制由线框构成的半径为2的三维球面
hidden off               	%对球面进行透明化处理
axis equal            
