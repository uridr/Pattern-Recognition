% Data
[Xtr, ytr, Xte, yte] = dataSets(123456, 789191, 500, [1 2], 0.5, 0.1);
% Functions (Neural Network)
lambda = 0;
[L, gL] = lossFunction(Xtr,ytr,lambda);
%% Training
% Optimitzation
eps  = 10^-6;
kmax = 500;
kmaxBLS = 30;
almax = 10;
c1 = 0.01;
c2 = 0.45;
x = [0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0]';
[xk,dk,alk,outk] = BFGS(x,L,gL,eps,kmax,kmaxBLS,almax,c1,c2);

%% Test
weights = xk(1:35,length(xk));
acc = modelAccuracy(weights,Xtr,ytr);

