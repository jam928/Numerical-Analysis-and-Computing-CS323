function test_my_exp

x = -5:0.001:5;
f = exp(x);
figure;
plot(x,f,'r--','linewidth',2);hold on; grid on;
for n = [1 2 3 5 100]
    p = my_exp(x,n);
    plot(x,p,'k-','linewidth',1);
    text(x(end),p(end),['n=' num2str(n)]);
end
legend('Exact','Approx');
title('Taylor approx of exp(x)');
xlabel('x');ylabel('y=e^x');
set(gca,'fontsize',20,'xtick',-5:1:5);