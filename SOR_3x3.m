clc
clear all
format short

W = 1.0583;
a = 0.7937;
b = -0.7783;
c = 0.1092;

w = (1-W)*a + (W/4)*(3 - ((-1)*(b) + (1)*(c)))

d = b;
e = w ;
f = c;
x = (1-W)*d + (W/3)*(-3 - ((-1)*(w) + (0)*(c)))

g = c;
h = w;
i = x;
y = (1-W)*g + (W/2)*(1 - ((1)*(w) + (0)*(x)))

NX = sqrt(w^2+x^2+y^2);
