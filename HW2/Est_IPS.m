function N11_est = Est_IPS(n11,n12,n21,n22,M1,M2,N,iter)

%2x2 matrix
S = [n11 n12; n21 n22];
%row marginal totals
rowMarginal = [M1 N-M1];
%column marginal totals
columnMarginal = [M2; N-M2];

st = size(S);
n = st(1);
m = st(2);

for i = 1:iter
   %row adjustment
   for j = 1:n
       S(j,:) = S(j,:) * rowMarginal(j) / sum(S(j,:));
   end
   %column adjustment
   for k = 1:m
       S(:,k) = S(:,k) * columnMarginal(k)/ sum(S(:,k));
   end
   N11_est(i) = S(1,1);    
end
