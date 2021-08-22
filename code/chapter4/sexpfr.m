function sexpfr(alpha)
% ????exp(-alpha*t)*u(t)????????????????
syms t mag pha
a = abs(alpha);
xt = exp(-a*t)*sym('heaviside(t)');
ezplot(xt);
set(findobj('Type','line'),'Color','k')
title('\rm e^{-|a|t} u(t)');
axis([0,3,0,1]);
figure(2);
Xf=fourier(xt);
subplot(1,2,1);
ezplot(abs(Xf));
set(findobj('Type','line'),'Color','k')
title('\rm F[e^{-|a|t} u(t)] ??????');
xlabel('f')
subplot(1,2,2);
pha=atan(imag(Xf)/real(Xf));
ezplot(pha);
set(findobj('Type','line'),'Color','k')
title('\rm F[e^{-|a|t} u(t)] ??????');
xlabel('f')
