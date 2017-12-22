function TestPoly(n)
X = -1:0.001:1;
% compute x and y
x = 0;
for i = 1:n+1
    x(i) = cos(((2*i-1)*pi)/(2*(n+1)));
end
y = f(x);
C = Pn(X,x,y);
L = LegPolyApprox(X,n);
figure;
plot(X,f(X), '--r', 'linewidth',2);hold on; grid on;
plot(X,C,'k','linewidth',2); 
plot(X,L,'b','linewidth',2);
legend('f(x)','c(x)','p(x)');
title(['f(x) = exp(sin(5x)), n = ', num2str(n)]);


% plot two figures
err = [max(abs(f(X)-C)) max(abs(f(X)-L)) sqrt(mean((f(X)-C).^2)) sqrt(mean((f(X)-L).^2))]
% keep this line as it is
figure;
plot(X,abs(f(X)-C),'k','linewidth',2); hold on; grid on;
plot(X,abs(f(X)-L),'b','linewidth',2);
legend('|f(x)-c(x)|','|f(x)-p(x)|');
title(['f(x) = exp(sin(5x)), n = ', num2str(n)]);

end