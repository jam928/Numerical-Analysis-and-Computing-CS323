function TestPn(n)
X = -5:0.001:5;
A = (2*rand(1,n+1)-1).*[1:n+1];
% generate a n-th order polynomial using A as coefficients
% sample (n+1) data points (x,y)
Y = 0;
for i = 1:(n+1)
    Y = Y(i) + A(i).*X.^(i-1);
end
ind = randsample(length(X),n+1);
x = X(ind);
y = Y(ind);
P = Pn(X,x,y);
figure;
plot(X,Y,'k-','linewidth',2);hold on; grid on;
plot(X,P,'r--','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
plot(x,y,'go','linewidth',3);
set(gca,'xtick',min(X):max(X));
% plot the title
title(['polynomial, n = ', num2str(n)]);