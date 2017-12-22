function N11_est = Est_MLE(n11,n12,n21,n22,M1,M2,N,iter)


for i = 1:iter
    if(i == 1)
        N11_est(1) = n11/(n11+n12+n21+n22) * N;
        continue
    end
    gN11 = n11/N11_est(i-1) - n12/(M1-N11_est(i-1)) - n21/(M2-N11_est(i-1)) + n22/(N-M1-M2+N11_est(i-1));
    gN11_prime = - n11/((N11_est(i-1))^2) - n12/((M1 - N11_est(i-1))^2) - n21/((M2 - N11_est(i-1))^2) - n22/((N - M1 - M2 + N11_est(i-1))^2); 
    
    N11_est(i) = N11_est(i-1)- (gN11/gN11_prime);
end
