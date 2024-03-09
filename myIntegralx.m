% PRACTICA UNIDAD 6
function [T,S]=myIntegral(n,a,b)
clc
% FUNCI�N DEL PROBLEMA
g= '(6*x^(2)+1) / ( x^(7) -8*x^(6) +24*x^(5) -32*x^(4) +16*x^(3))';

n=input('Ingrese el n�mero de subintervalos (debe ser n�mero par, para el funcionamiento del m�todo de simpson): ');
a=input('Ingrese el l�mite inferior de la integral: ');
b=input('Ingrese el l�mite superior de la integral: ');
f=inline(g);

%%%%%% METODO DEL TRAPECIO %%%%%
h=(b-a)/n;
T=0;

% CALCULO DEL AREA DE CADA TRAPECIO DE CADA SUBINTERVALO
for i=1:n
    T= (h/2)*(f(a+(i-1)*h)+f(a+(i)*h))+T;
end
T  % PARA PODER MOSTRAR EL VALOR DE T


%%%%%%%  METODO DE SIMPSON  (1/3) %%%%%%%%%
h=(b-a)/n;
S=0;
sumai=0;
sumap=0;

for i=1:2:n-1
    sumai=sumai+feval(f,h*i+a);
end
for i=2:2:n-2
    sumap=sumap+feval(f,h*i+a);
end

S=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b))

end