function TestP2
A0 = rand; A1 = rand*2; A2 = rand*3;
x = -20:0.01:20;
y = A0 + A1*x + A2.*x.^2;
ind = randsample(length(x),3);
x0 = x(ind(1)); y0 = y(ind(1));
x1 = x(ind(2)); y1 = y(ind(2));
x2 = x(ind(3)); y2 = y(ind(3));
a2 = ((y2-y1)*(x1-x0)-(y1-y0)*(x2-x1));
a2 = a2/((x2-x1)*(x1-x0)*(x2-x0));
a1 = (y2-y1)./(x2-x1) - a2*(x2+x1);
a0 = y2 - a1*x2 - a2.*x2.^2;
[A0 A1 A2;a0 a1 a2]
L0 = (x-x1).*(x-x2)./((x1-x0)*(x2-x0));
L1 = (x-x0).*(x-x2)./((x2-x1)*(x0-x1));
L2 = (x-x1).*(x-x0)./((x1-x2)*(x0-x2));
Y = y0*L0 + y1*L1 + y2*L2;
figure;
plot(x,y,'k-','linewidth',2);hold on; grid on;
plot(x,Y,'r--','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
plot([x0 x1 x2],[y0 y1 y2],'go','linewidth',3);