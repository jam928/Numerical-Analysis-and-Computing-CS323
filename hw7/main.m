function main
%function
f = @(x)(exp(x).*cos(x));
n = 1:10:1000;
% Lower limit
a = 0;
%Upper limit
b = pi;

% Exact solution
Exact = integral(f,a,b);

%intialize the error vectors
errorSimp = zeros(1,100);
errorTrap = zeros(1,100);
errorGL2N = zeros(1,100);
errorGL3N = zeros(1,100);



for k = 1:100
%calling simpson function & the trapezoidal function
estSimp = Simpsons(f,a,b,n(k));
estTrap = Trapezoidal(f,a,b,n(k));
estGL2N = GL2N(f,a,b,n(k));
estGL3N = GL3N(f,a,b,n(k));

%error computation
errorSimp(k) = abs(Exact - estSimp);
errorTrap(k) = abs(Exact - estTrap);
errorGL2N(k) = abs(Exact - estGL2N);
errorGL3N(k) = abs(Exact - estGL3N);


end
% Plotting the Error VS N in loglog graph
loglog(n,errorTrap,'r'); grid on; hold on;
loglog(n,errorSimp,'g'); 
loglog(n,errorGL2N,'b');
loglog(n,errorGL3N,'k');
xlabel('N');ylabel('Error');
title('f(x)=e^x cos(x)');
legend('Tn','Sn','GL2n','GL3N','Location','southwest');
end