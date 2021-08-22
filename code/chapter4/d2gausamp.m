N=10000;
C=[1,1/2;1/2,1];
m=[0,0]';
y=zeros(N,2);
for j=1:N
    y(j,:)=gausamp(m,C);
end
[N_samp,xx]=hist3(y,[20,20]);
x1=xx{1};
x2=xx{2};
dx1=x1(3)-x1(2);
dx2=x2(3)-x2(2);
p_hist=N_samp/(N*dx1*dx2);
mesh(x1,x2,p_hist);
xlabel('x1');
