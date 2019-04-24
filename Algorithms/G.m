function [xk,dk,alk,outk] = G(x,f,g,eps,kmax,kmaxBLS,almax,c1,c2)
    
k     = 1; 
al    = almax;
xk    = [x];
dk    = [];
alk   = [al];
outk  = [];

while norm(g(x)) > eps & k < kmax
    
   d          = -g(x);  
   
   if k ~= 1  al = 2*(f(x)-f(xk(1:end,end-1))) / (-d'*d); end
   
   [al,iout]  = BLS(f,g,x,d,almax,c1,c2,kmaxBLS,sqrt(eps));
   x          = x + al*d;
   
   dk       = [dk d];
   xk       = [xk x];
   alk      = [alk al];
   outk     = [outk iout];
   k        = k + 1;
   
end
end

