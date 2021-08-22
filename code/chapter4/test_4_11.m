%test for figure4-11

% gauss theoratical equaction
x=-5:0.005:5-0.005;
y=1/sqrt(2*pi)*exp(-x.^2/2);
% approxcimately simulate of gauss
[y1,y2]=bmgauss(0,1,2000);
[f,x1] = hist(y1,40);
del_x = x1(5)-x1(4);
p_hist=f/2000/del_x;
plot(x,y,'k',x1,p_hist,'ok','LineWidth',1)
ylabel('????');
xlabel('???? x');
legend('????????','????????????');