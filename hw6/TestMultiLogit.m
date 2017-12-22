function TestMultiLogit(v,Lam,numIter)
data = feval('load','zip.train');
X = data(:,2:end); Y = data(:,1)+1; X = [X(:,1)*0+1 X];


data = feval('load','zip.test');
Xt = data(:,2:end); Yt = data(:,1)+1; Xt = [Xt(:,1)*0+1 Xt];

m = 1:numIter;
for lam = Lam
    [err, loglik, err_t] = FitMultiLogit(X,Y,Xt,Yt,numIter,v,lam);
    
    figure(1);
    plot(m,err*100,'linewidth',2); hold on; grid on; set(gca,'FontSize',20);
    xlabel('Iteration'); ylabel('Mis-Classification Error (%)');
    % write the corresponding text at the end of the curve.
    axis([1 numIter 0 16]);
    title(['Train Mis-Classfication Error: \nu = ' num2str(v)]);
    figure(2);
    plot(m,loglik,'linewidth',2); hold on; grid on; set(gca,'FontSize',20);
    xlabel('Iteration'); ylabel('Log likelihood');
    % write the corresponding text at the end of the curve.
    axis([1 numIter -15000 1000]);
    title(['Train Log Likelihood: \nu = ' num2str(v)]);
    figure(3);
    plot(m,err_t*100,'linewidth',2); hold on; grid on; set(gca,'FontSize',20);
    xlabel('Iteration'); ylabel('Mis-Classification Error (%)');
    % write the corresponding text at the end of the curve.
    axis([1 numIter 5 30]);
    title(['Test Mis-Classfication Error: \nu = ' num2str(v)]);
end