syms x y;
f=[x^2+y^2;sin(x)*log(y);x*exp(-y)];
jacobian(f,[x y])
