function [xk,dk,alk,iWk] = G(x,f,g,Q,eps,kmax,almax,almin,rho,c1,c2,iW)
    
k     = 1; 
al    = almax;
xk    = [x];
dk    = [];
iWk   = [];
alk   = [al]; 

while norm(g(x)) > eps & k < kmax
    
   d       = -g(x);  
   %Line Search
   if  iW == 0
       al  = -g(x)'*d/(d'*Q*d);
       iWi = 0;
   else [al,iWi]  = BLS(x,d,f,g,almax,almin,rho,c1,c2,iW); 
   end
   x        = x + al*d;
   
   dk       = [dk d];
   xk       = [xk x];
   iWk      = [iWk iWi];
   alk      = [alk al];
   k        = k + 1;
   
end

end

