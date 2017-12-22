function y = LegPoly(n,x)
pn_p1 = 1;
y = ones(size(x,1), size(x,2));
 
if(n>0)
    pn_1 = x.*y;
if(n==1)
    y = pn_1;
else
    for n = 2 : n
        pn_p1 = (x .* (2 * n - 1).*pn_1 - (n - 1)*y)/n;
        y = pn_1;
        pn_1 = pn_p1;
    end
    y = pn_p1;
end
end
end