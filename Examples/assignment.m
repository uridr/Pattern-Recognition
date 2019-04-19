%% Data Set Generation

trFq       = 0.5;
noFq       = 0.1;
trSeed     = 1234;
teSeed     = 123;
target     = [4];
samples    = 500;

[Xtr,ytr,Xte,yte] = dataSets(trSeed,teSeed,samples,target,trFq,noFq);

%% Neural Network Generation

lambda = 0.0;

[L,gL] = lossFunction(Xtr,ytr,lambda);

%% Optimization Specifications

c1      = 0.01;
c2      = 0.9;
al      = 10;
isd     = 1;
eps     = 10^-6;
kmax    = 1000;
kmaxBLS = 30;

x = [0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0, 0 0 0 0 0]';

[xk,dk,alk,outk] = G(x,L,gL,eps,kmax,kmaxBLS,al,c1,c2);

%% Acurracy

weights = xk(1:35,size(xk,2));

trAcc = modelAccuracy(weights,Xtr,ytr);
teAcc = modelAccuracy(weights,Xte,yte);

%% Weight Plot

numPlot(weights,1);




