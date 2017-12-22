function B = NCS(x,y)

n = length(x)-1;
A = zeros(4* n);
%upper rows of the x^3, x^2, and x values
row = 1;
i = 1;
for column =1:4:4*n
    A(row,column)=  x(i)^3;
    A(row,column+1)=  x(i)^2;
    A(row ,column +2)= x(i);
    A(row,column+3) = 1;
    i = i + 1;
    row = row +2;
end
 
%upper rows of the x^3, x^2, and x values 
row = 2;
i = 2;
for column = 1:4:4*n
    A(row,column)= x(i)^3;
    A(row,column +1)= x(i)^2;
    A(row,column+2)= x(i);
    A(row,column+3) = 1;
    i = i + 1;
    row = row +2;
end
 
%first derivative continuity requirement(LHS)
row = 2*n+1;
i = 2;
for column = 1:4:4*n-4
    A(row,column) = 3*x(i)^2;
    A(row,column +1)=2*x(i);
    A(row ,column +2)=1;
    i = i + 1;
    row =row + 1;
end

%first derivative continuity requirement(RHS)
row=2*n+1;
i=2;
for column = 5:4:4*n
    A(row,column)= -3*x(i)^2;
    A(row,column+1)= -2* x(i);
    A(row ,column +2)=-1;
    i = i +1;
    row =row +1;
end

%Second derivative continuity requirement(LHS)
row=3*n;
i=2;
for column = 1:4:4*n-4
    A(row,column)=6*x(i);
    A(row,column+1)=2;
    i=i+1;
    row=row+1;
end

%Second derivative continuity requirement(RHS)
row=3*n;
i=2;
for column =5:4:4*n
    A(row,column)= -6*x(i);
    A(row,column +1)= -2;
    i=i+1;
    row =row+1;
end

A(4*n-1,1)=6*x(1);
A(4*n-1,2)=2;
A(4*n,4*n-3)=6*x(n+1);
A(4*n,4*n-2)=2;
 
Z = zeros(4*n ,1);
Z(1)= y(1);
for i =2:2:(2*n -2)
    Z(i)=y(i/2+1);
    Z(i+1)= y(i/2+1);
end
Z (2*n)=y(end);

B=A\Z;


end


