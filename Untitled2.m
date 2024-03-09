
clc
syms x;
format short
a = [1 0 -12000 0 1800000];
u = roots(a)

ss = [1 -120 1200];
SS = [1 -120 1200];

d = conv(ss,SS)

x = [1 3];
y = [4 9.5];
b = conv(x,y);
d = b - [0 16 0];
r = roots(d);
o = eps;

