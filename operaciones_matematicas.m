clc
clear all
format short
 
% RAICES DE POLINOMIO
p = [1 5.33 23.86 34.4 38.4];
q = [1 3 9.6];
P = roots(p)
Q = roots(q);

%DIVISION Y MULTIPLICACION DE POLINOMIOS 
SS = [1 4 16];
ss = [3 6 9.6];
TT = -[1 3 9.6];
tt = -[0 2 4];
u = conv(SS,ss);
U = conv(TT,tt);
v = u - U;
V = v/v(1);
a = roots(V);

%DERIVADA
syms x;
b = (x^3 + 3*x^2 + 9.6*x + 0)/(x^2 + 4*x + 16);
k = diff (b);
l = solve(k);

%FACTOR COMUN 
factor(2*x^5 + 11*x^4 + 36*x^3 + 84*x^2 + 160*x + 64);


