function [xk,dk,alk,outk] = G(x,f,g,eps,kmax,almax,c1,c2)
    
k     = 1; 
al    = almax;
xk    = [x];
dk    = [];
alk   = [al];
outk  = [];

while norm(g(x)) > eps & k < kmax
    
   d          = -g(x);  
   [al,iout]  = BLS(f,g,x,d,almax,c1,c2,kmax,eps);
   x          = x + al*d;
   
   dk       = [dk d];
   xk       = [xk x];
   alk      = [alk al];
   outk     = [outk iout];
   k        = k + 1;
   
end
end

