function P = Pn(X,x,y)

n = length(x);
L = ones(n,length(X));

for i = 1:n
    for k = 1:n
        if(i ~= k)
            L(i,:) = L(i,:).*((X-x(k))/(x(i)-x(k)));
        end
    end
end

P = 0;
for k = 1:n
    P = P + y(k).*L(k,:);
end
end
