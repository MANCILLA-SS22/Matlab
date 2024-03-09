%PRACTICA #6
%MANCILLA CHAVEZ GERMAN C17210154
%Bryan Joel Rincón Arellano 18211376
%Daniel Alberto González Plascencia 18211352
%Jose Alberto Platas Mirón 18211372
%C17210154
function [T, S13, S38]=myIntegral(n)
% FUNCIÓN DEL PROBLEMA
clc
fprintf('FUNCION (e^x)^2 CON LIMITES DE 0 A 1\n');

g = 'exp(x^2)';
a= 0;
b= 1;
A= 0;
B= 1;
n=input('Ingrese el número de subintervalos metodo del trapecio): ');
o=input('Ingrese el número de subintervalos para 1/3 ): ');
p=input('Ingrese el número de subintervalos para 3/8 ): ');

%%%%%%%%%%%%%%%%%%%%%%%%%%% METODO DEL TRAPECIO %%%%%%%%%%%%%%%%%%%%%%%%%%
h=(b-a)/n; f=inline(g); 
T=0;
for i=1:n 
    T= (h/2)*(f(a+(i-1)*h)+f(a+(i)*h))+T;
end
fprintf('POR METODO DE TRAPEZOIDE');
T


%%%%%%%%%%%%%%%%%%%%% METODO DE SIMPSON  (1/3) %%%%%%%%%%%%%%%%%%%%%%%%%%%
j=2*o;
h=(b-a)/j; f=inline(g); 
S13=0;
for i=1:o
    S13=S13+(h/3)*(f(a)+4*f(a+h)+f(a+2*h));
    a=a+2*h;
end
fprintf('POR METODO DE SIMPSON (1/3)');
S13

%%%%%%%%%%%%%%%%%%%%% METODO DE SIMPSON  (3/8) %%%%%%%%%%%%%%%%%%%%%%%%%%%
k=3*p;
h=(B-A)/k; f=inline(g); 
S38=0;
for i=1:p
    S38=S38+(3*h/8)*(f(A)+3*f(A+h)+3*f(A+2*h)+f(A+3*h));
    A=A+3*h;
end
fprintf('POR METODO DE SIMPSON (3/8)');
S38
end
