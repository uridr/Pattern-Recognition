function [xk,dk,alk,outk, Hk] = BFGS(x,f,g,eps,kmax,kmaxBLS,almax,c1,c2)

k    = 1;
I    = eye(length(x));
al   = almax;
dk   = [];
xk   = [x];
H    = I;
Hk   = [];
alk  = [al];
outk = [];

while norm(g(x)) > eps & k < kmax

    gx = g(x);
    d  = -H*gx;
    
    if k ~= 1  al = 2*(f(x)-f(xk(1:end,end-1))) / (gx'*d); end
   [al,iout]  = BLS(f,g,x,d,almax,c1,c2,kmaxBLS,sqrt(eps));
   
   x  = x + al*d;
   sk = al*d; yk = g(x)- gx; pk = 1/(yk'*sk);
   H  = (I-pk*sk*yk')*H*(I-pk*yk*sk')+pk*sk*sk';
   k  = k + 1;
   
   dk       = [dk d];
   xk       = [xk x];
   Hk       = [Hk H]; 
   outk     = [outk iout];
   alk      = [alk al];
   
end
end