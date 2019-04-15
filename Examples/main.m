% Data
[Xtr, ytr, Xte, yte] = dataSets(2234, 2134, 5, [1 2], 0.5, 0.1);
% Functions (Neural Network)
[L, gL] = lossFunction(Xtr,ytr,0.1);
%% Training
% Optimitzation
eps  = 10^-3;
kmax = 100;
almax = 1;
c1 = 0.1;
c2 = 0.9;
x = [0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0]';
[xk,dk,alk,outk] = G(x,L,gL,eps,kmax,almax,c1,c2);

%% Test
weights = xk(1:35,length(xk));
acc = modelAccuracy(weights,Xte,yte);

