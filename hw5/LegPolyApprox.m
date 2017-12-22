function L = LegPolyApprox(X,n)
L = 0;
for j=0:n
    fun = @(X)f(X).*LegPoly(j,X);
    L = L + (j + .5)*integral(fun,-1,1).*LegPoly(j,X);
end

end