function  [xk,dk,alk,iWk,betak] = CG(x,f,g,Q,eps,kmax,almax,almin,rho,c1,c2,iW,icg,irc,nu)

k     = 0; 
d     = -g(x);
al    = almax;
xk    = [x];
dk    = [];
iWk   = [];
alk   = [al]; 
betak = [];

while norm(g(x)) > eps & k < kmax

   %Line Search
   if  iW == 0
       al  = -g(x)'*d/(d'*Q*d);
       iWi = 0;
   else [al,iWi]  = BLS(x,d,f,g,almax,almin,rho,c1,c2,iW); 
   end
   x        = x + al*d;
   k        = k + 1; 
   
   gx  = g(x);
   gxk = g(xk(1:end,k));
   
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
   iWk      = [iWk, iWi];
   alk      = [alk,al];
   betak    = [betak,beta];
  
end

end