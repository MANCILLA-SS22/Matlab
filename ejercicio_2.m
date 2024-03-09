% Examen ordinario Análisis numerico 2019B
clc
clear all
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \n ');


A = hilb(4)

B = [1 1 1 1]';

fprintf('Problema 1 \n ');
Cholesky = chol(A)

X = A\B

%%%%%%%%%%%%%%%%%%%%

fprintf('Problema 2 \n ');

A = hilb(3);
B = [1 1 1]';

Tj = inv(diag(diag(A)))*(A - diag(diag(A)));
pp = eig(Tj);
ww = 2./(1+sqrt(1-pp.^2));

w = max(ww)

x = [1 1 1];
l2ant = norm(x);
error =100;
conta = 0;
while(error>2)
  conta = conta + 1;
%    fprintf('Iteration %d  de SOR \n',conta);
    x(1) = (1-w)*x(1) + (w/A(1,1))*(B(1) - (A(1,2)*x(2) + A(1,3)*x(3) ));
    x(2) = (1-w)*x(2) + (w/A(2,2))*(B(2) - (A(2,1)*x(1) + A(2,3)*x(3) ));
    x(3) = (1-w)*x(3) + (w/A(3,3))*(B(3) - (A(3,1)*x(1) + A(3,2)*x(2) ));
    x
    l2 = norm(x);
    error = abs((l2 - l2ant)/l2)*100;
    l2ant = l2;
end
fprintf('Problem 2 solved with SOR after %d iterations \n ', conta);
x
%%%%%%%%%%%%%

fprintf('Problema 3 solved with GCP \n ');

X = GC(A, B);