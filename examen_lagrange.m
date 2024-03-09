clc 
clear all
format long
syms x
%Li(x) = || (x-xj)/(xi-xj)
%     0  1  2  3
X = [-2 -1 2  4];  
Y = [-3 -1 3 -1];

%Para i=0

LX0 = ((x - X(2))/(X(1) - X(2)))*((x - X(3))/(X(1) - X(3)))*((x - X(4))/(X(1) - X(4)));
        %j=1             %j=2            %j=3
a = expand(LX0)

%Para i=1

LX1 = ((x - X(1))/(X(2) - X(1)))*((x - X(3))/(X(2) - X(3)))*((x - X(4))/(X(2) - X(4)));
        %j=0             %j=2            %j=3
b = expand(LX1)

%Para i=2

LX2 = ((x - X(1))/(X(3) - X(1)))*((x - X(2))/(X(3) - X(2)))*((x - X(4))/(X(3) - X(4)));
        %j=0             %j=1            %j=3
c = expand(LX2)

%Para i=3

LX3 = ((x - X(1))/(X(4) - X(1)))*((x - X(2))/(X(4) - X(2)))*((x - X(3))/(X(4) - X(3)));
        %j=0            %j=1            %j=1
d = expand(LX3)

%Para hallar (LX)*(f(x))
w = a*Y(1)
x = b*Y(2)
y = c*Y(3)
z = d*Y(4)
fprintf('\nNuestro polinomio que mejor se ajusta es:\n');
LiX = w + x + y + z