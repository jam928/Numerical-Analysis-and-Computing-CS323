function [err, loglik, err_t] = FitMultiLogit(X,Y,Xt,Yt,numIter,v,lam)


%beta vector
b = zeros(length(X),1);

%calculate the probability vector
p = 0;
K = 11;
c = 0;
for k = 1:numIter
    a = exp(X(k))*b(k);
    for s = 1:K-1
        c = c + exp(X(k))*b(s);
    end
    p(k) = a/c;
end
%W vector

diag_elements = 0;
for i=1:numIter
    diag_elements = p(i)*(1-p(i));
end
W = diag(diag_elements);
%r vector
r =0;
for i = 1:numIter
    for k = 1:(K-1)
        if(Y(i) == k)
            r(i) = 1;
        end
    end
end

%calculate betak t
for t = 1:numIter
    for k=1:(K-1)
        b(t) = b(t-1) + v.*((X'.*W(i-1).*X + lamba)^(-1).*((X')*(r(k)-p(t-1))-lam.*b(t-1)));
    end
end

%calculate loglik function 
%left hand side of the function
log_lik_l = 0;
for i = 1:numIter
    for k = 1:(K-1)
        log_lik_l = log_lik_l + r(k)*log(p(k));
    end
end

%right hand side 
if(lam > 0)
    log_lik_r = 0;
    p = length(X(1));
    for k=1:(K-1)
        for j = 0:p
            log_lik_r = log_lik_r + b(k).^2;
        end
    end
end
loglik = log_lik_l - (lam/2).*log_lik_r;

    


            
        
end

