clc
clear all
close all

syms L f s x  
x = 0.1034; % x = tau
fprintf('                     Laplace inversa para la funcion escalon\n')
f = (1/s)*((1/x)/(s+(1/x)))
L = ilaplace(f)

fprintf('                     Laplace inversa para la funcion escalon')
f = (1)*((1/x)/(s+(1/x)))
L = ilaplace(f)

fprintf('                     Laplace inversa para la funcion rampa')
f = ((1)/(s^2))*((1/x)/(s+(1/x)))
L = ilaplace(f)