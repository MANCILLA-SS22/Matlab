function L = LeyGravdeNewton
format long
G= 6.673e-11;
m1= 6e+24;
m2= 7.4e+22;
r =(3.8e+8 : (0.2e+8)/10 : 4e+8);
F = (G*m1*m2)./(r.^2);
r=r';
F=F';
L=table(F,r);
end