syms x u t;
int((x+sin(x))/(1+cos(x)))  		%求不定积分 

int(cos(x)*exp(x),0,1)      		%求定积分 

int(u*sin(x),x,1,sin(t))

f=[u*x^2,t*sin(x);2*x,x*exp(x)];
int(f)
