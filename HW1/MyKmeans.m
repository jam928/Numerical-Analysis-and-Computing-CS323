function [idx,C,sumD,D] = MyKmeans(X,K,C0,numIter)

sumD = zeros(1,numIter);

C = C0;  n = size(X,1);ONES=ones(n,1);ONESK = ones(n,K);

for t = 1:numIter
    D = ONESK+ONES*sum(C.^2,2)' - 2*X*C'; 
    [d,idx(t,:)]=min(D,[],2); 
    sumD(t) = sum(d);
    for k = 1:K
        C(k,:) = mean(X(idx(t,:)==k,:));
    end    
end;




   