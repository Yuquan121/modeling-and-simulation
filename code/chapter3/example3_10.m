syms x a b c;
f1=sin(x)/(x^3+3*x);
limit(f1,x,0)

limit(f1,0)

limit(1/x,x,0,'right')
    				
limit(1/x,x,0,'left')

findsym(f2,3)
       		
limit(f2,a,1) 			%自定义a为自变量

limit(f2,c,1) 			%定义c为自变量

limit(f2,1)   			%在没有定义自变量的情况下，默认排序离x最近的c为自变量

limit(f3,x,inf)  		%求x趋于无穷大时f3的极限

