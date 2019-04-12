function [xk,dk,alk,iWk, Hk] = BFGS(x,f,g,Q,eps,kmax,almax,almin,rho,c1,c2,iW)

k   = 0;
I   = eye(length(size(g)));
al  = almax;
dk  = [];
xk  = [x];
H = I;
Hk  = [];
iWk = [];
alk = [al];

while norm(g(x)) > eps & k < kmax

    gx = g(x);
    d  = -H*gx;
   if   iW == 0
        al  = -gx'*d/(d'*Q*d);
        iWi = 0;
   else [al,iWi]  = BLS(x,d,f,g,almax,almin,rho,c1,c2,iW); end
   x  = x + al*d;
   sk = al*d; yk = g(x)- gx; pk = 1/(yk'*sk);
   H  = (I-pk*sk*yk')*H*(I-pk*yk*sk')+pk*sk*sk';
   k  = k + 1;
   
   dk       = [dk d];
   xk       = [xk x];
   Hk       = [Hk H]; 
   iWk      = [iWk iWi];
   alk      = [alk al];
   
end
end