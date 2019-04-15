function [L,gL] = lossFunction(Xtr,ytr,la)

sig = @(X)   1./(1+exp(-X));
y   = @(X,w) sig(w'*sig(X));
L   = @(w)   norm(y(Xtr,w)-ytr)^2 + (la*norm(w)^2)/2;
gL  = @(w)   2*sig(Xtr)*((y(Xtr,w)-ytr).*(y(Xtr,w).*(1-y(Xtr,w))))'+la*w;

end
