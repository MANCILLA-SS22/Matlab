clc
clear all
close all
format long
hold on
%Para el caso 1 utilizar un valor de p igual a 1
%Para el caso 2 utilizar un valor de p igual a 2
%Para el caso 3 utilizar un valor de p igual a 3

p=3;

if (p==1)
R = 100;             %Valor de la resistencia
L = 250E-3 ;         %Valor del inductor
C = 15E-6 ;          %Valor del capacitor
f1 = tf([1/(L*C)],[1 R/L 1/(L*C)]) %Función de transferencia
t = [0:0.0001:0.03];   %Valor de tiempo
end

if (p==2)
R = 20;             %Valor de la resistencia
L = 80E-3 ;         %Valor del inductor
C = 130E-6 ;          %Valor del capacitor
f1 = tf([1/(L*C)],[1 R/L 1/(L*C)]) %Función de transferencia
t = [0:0.0001:0.05];   %Valor de tiempo
end

if (p==3)
R = 4.7;             %Valor de la resistencia
L = 7.61E-3 ;         %Valor del inductor
C = 100E-6 ;          %Valor del capacitor
f1 = tf([1/(L*C)],[1 R/L 1/(L*C)]) %Función de transferencia
t = [0:0.00001:0.03];   %Valor de tiempo
end

ye = step(f1,t);  %Respuesta a un escalon unitario
plot(t,ye);
title ('Respuesta a un escalon unitario');
xlabel ('tiempo(seg)');
grid;