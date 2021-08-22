x=randi([0,1],3000,1);
y=[[0];rcosflt(x,1,10)];
figure(1)
t=1:30061;
plot(t,y,'linewidth',1);axis([1,300,-.5,1.5]);
grid on 
eyediagram(y,20,40);
t1=t';
D=[t1 y];
