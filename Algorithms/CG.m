function  [xk,dk,alk,outk,betak] = CG(x,f,g,eps,kmax,kmaxBLS,almax,c1,c2,icg,irc,nu)

k     = 1; 
d     = -g(x);
al    = almax;
xk    = [x];
dk    = [];
alk   = [al];
outk  = [];
betak = [];

while norm(g(x)) > eps & k < kmax

   %Line Search
   if k ~= 1  al = 2*(f(x)-f(xk(1:end,end-1))) / (gx'*d); end
   [al,iout]  = BLS(f,g,x,d,almax,c1,c2,kmaxBLS,sqrt(eps)); 
   
   x        = x + al*d;
   k        = k + 1; 
   
   gx  = g(x);
   gxk = g(xk(1:end,k-1));
   
   %Beta Conditions
   if icg == 1 beta = gx'*gx/norm(gxk)^2; 
   else        beta = max(0,gx'*(gx-gxk)/norm(gxk)^2); end
   
   %Restart Conditions
   if irc == 1 & mod(k,nu) == 0
        d = -gx;
   elseif irc == 2 & abs(gx'*gxk)/norm(gx)^2 >= nu
        d = -gx; 
   else d = -gx+beta*d; end

   xk       = [xk, x];
   dk       = [dk,d];
   alk      = [alk,al];
   outk     = [outk, iout];
   betak    = [betak,beta];
  
end

end