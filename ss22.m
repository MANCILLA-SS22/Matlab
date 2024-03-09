clc
clear all
format short

 x = 1;
 y = -.1808;
 z = 0.4265;
 
m = 10*x - 2*y^2 + y - 2*z - 5;
n = 8*y^2 + 4*z^2 - 9;
o = 8*y*z + 4;

h = (n)^2 + (m)^2 + (o)^2 


a = [10, 0, 0;
     5, -16, 8;
     -2, 8, -8];
 
 b = [0;3;-4];
 
 c = 2*a*b;
 
 d = (c)/(norm(c));
 
l = [1;-1;1] - 0.5257*d;


M = [3   1.5    1.25; 
    1.5  1.25   1.1250; 
    1.25 1.1250 1.0625];
   
N = [126.2245;
     23.0642;
     78.1603];

o = (M^-1)*N;
