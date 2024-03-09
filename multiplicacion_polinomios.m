clc
clear all
format shortEng
 
%DIVISION Y MULTIPLICACION DE POLINOMIOS 
x = [0.26e-3 40.2e-12 1.25e-20 7.68e-31 0];
y = [-0.15 0.13e-12 1.44e-12 4.6e-22 5.12e-43];
z = conv(x,y)

a = [0 26e-21 7e-27 8.07e-30 1.7e-36 52.52e-45 38.75e-54];
b = [1 0.31e-9 0 0 0 0 0];
c = conv(a,b)

%i = [-0.15e-3 0.13e-12 1.44e-12 4.6e-22 5.12e-43];
%j = [1 0.31e-9 0 0 0];
%k = conv(i,j)

i = z - c;






%TT = -[1 3 9.6];
%tt = -[0 2 4];
%U = conv(TT,tt);

%v = u - U;
%V = v/v(1);
%a = roots(V);