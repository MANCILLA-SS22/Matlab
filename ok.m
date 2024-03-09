format short
clc
clear all
syms x y z h1 h2 h3;

% ENCONTRAR EL VECTOR JACOBIANO 
x1 = [1;-0.5;1];
f1 = [(sin(x+y) + sin(x) - cos(y) ); 
     (x^2 + y^2 - 3*z^2);
     (x^2 + 2*y^4 + 3*z^3 - 1)];

p = [x y z];

J = jacobian(f1,p);

s = J';

q = [1,-0.5,1];

r = subs(J, p, q);

j = r';

f = subs(f1, p, q);
c = 2*j*f;

r = c/norm(c);

h1 = x1 - 0*r;

h2 = x1 - 0.5*r; 

h3 = x1 - 1*r; 

SS = [h1 h2 h3];
h4 = subs(f1(1), SS, h1(1))
 
h1 + h2 + h3


m = [3   1.5    1.25; 
    1.5  1.25   1.1250; 
    1.25 1.1250 1.0625];
   
n = [h1 + h2 + h3;
     h2*0.5 + h3;
     h2*0.5^2 + h3;]

o = (m^-1)*n;
  
t = -(o(2))/(2*o(3));
 
X = x1 - t*r;
 