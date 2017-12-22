function T = Trapezoidal(f,a,b,n)
    h = (b-a)/(n);
    x = a:h:b;
    %find the area under the curve
    T = 0;
    for i = 2:length(x)-1
       T = T + (2*f(x(i))); 
    end
    T = h/2 * (f(x(1)) + T + f(x(end)));  
end