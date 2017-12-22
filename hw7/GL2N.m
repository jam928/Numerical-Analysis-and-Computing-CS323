function gl2n = GL2N(f,a,b,n)
x = 0;
h = (b-a)/(n/2);
for i = 1:n/2+1
    x(i) = a + h*i;
end
gl2n = 0;
%approx formula
for i = 1:(n/2-1)
    gl2n = gl2n + f((x(i) + x(i+1) - (2*h)/sqrt(3))*0.5) + f((x(i) + x(i+1) + (2*h)/sqrt(3))*0.5);
end
    gl2n = gl2n * h/2;
end
 


