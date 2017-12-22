function p = my_exp(x,n)

p = 1; t = 1;
for i = 1:n
    t = t.*x/i;
    p = p + t;
end
end