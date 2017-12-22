function S = Simpsons(f,a,b,n)

h = (b-a)/(n-1);
x = a:h:b;
S = 0;
% find the area under the curve
for i = 1:2:length(x)-1
    S = S + h/3* (f(x(i)) + 4*f(x(i+1)) + f(x(i+2)));
end

end