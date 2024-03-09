format short
clc
syms x1 x2 x3;
%Vector de respuesta inicial
X0(1,1)=-1;
X0(2,1)=-2;
X0(3,1)=1;


    %Se obtienen valores de las funciones originales
    f1 = x1.^3 + ((x1.^2)*x2) - (x1*x3) + 6;
    f2 = exp(x1) + exp(x2) - x3;
    f3 = x2.^2 - (2*x1*x3);
    a = diff(f1,x1);
    b = diff(f1,x2);
    c = diff(f1,x3);
    
    d = diff(f2,x1);
    e = diff(f2,x2);
    f = diff(f2,x3);
    
    g = diff(f3,x1);
    h = diff(f3,x2);
    i = diff(f3,x3);
    
    ss = [a,b,c ; d,e,f ; g,h,i]
    
