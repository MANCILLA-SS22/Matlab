function x = GC(A, B)
clc
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \n');

x = ones(size(B));


r = B - A*x;
d = r;

for i=1:3
  fprintf('----- Iteration %d of GC-------\n',i);

  alpha = (r'*r)/(d'*A*d);
  fprintf('Alpha: %f \n ',alpha);
  
  x = x + alpha*d

  rn = r-alpha*A*d;
  
  beta = (rn'*rn)/(r'*r);
  fprintf('Beta: %f \n ',beta);

  d = rn + beta*d;
  r = rn;
end