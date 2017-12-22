function gl3n = GL3N(f,a,b,n)

h = (b-a)/(n/3);
x = 0;
for i = 1:n/3
    x(i) = a + h*i;
end
gl3n = 0;
%approxmation formula
for i = 1:(n/3 - 1)
    gl3n = gl3n + (5/9)*f((x(i) + x(i+1) - 3*h*sqrt((3/5)))*0.5) + (8/9)*f((x(i) + x(i+1))*0.5) + (5/9)*f((x(i) + x(i+1) + 3*h*sqrt((3/5)))*0.5);
end
gl3n = gl3n * 1.5 * h/3;
end