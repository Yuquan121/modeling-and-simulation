x=0:0.01:10;
y1=sin(x);
y2=x.*sin(x);        			%y2=xsinx
y3=exp(2*cos(x));    			% 
plot(x,y1,x,y2,x,y3)
