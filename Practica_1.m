
Z = [0.0046 0.8345 0.0381 0.0163 0.0050 0.0074 0.0287 0.0220 0.0434];
K = [1.65 1.80 0.94 0.55 0.40 0.38 0.22 0.14 0.09];
clc
syms x;
format short


fun1 = Z(1)*K(1)/(1 + (K(1)-1)*x) + Z(2)*K(2)/(1 + (K(2)-1)*x)+ Z(3)*K(3)/(1-(K(3)-1)*x) + Z(4)*K(4)/(1 - (K(4)-1)*x)+ Z(5)*K(5)/(1-(K(5)-1)*x) + Z(6)*K(6)/(1-(K(6)-1)*x)+ Z(7)*K(7)/(1-(K(7)-1)*x)+ Z(8)*K(8)/(1-(K(7)-1)*x)+ Z(9)*K(9)/(1-(K(9)-1)*x);

fun2 = Z(1)/(1 + (K(1)-1)*x) + Z(2)/(1 + (K(2)-1)*x)+ Z(3)/(1 + (K(3)-1)*x) + Z(4)/(1 + (K(4)-1)*x)+ Z(5)/(1 + (K(5)-1)*x) + Z(6)/(1 + (K(6)-1)*x)+ Z(7)/(1 + (K(7)-1)*x)+ Z(8)/(1 + (K(8)-1)*x)+ Z(9)/(1 + (K(9)-1)*x);

fun = log(fun1)-log(fun2);

ai=0.5;
bi=1;
tol = 0.001;

u = subs(fun, ai);   %funcion evaluada en ai
v = subs(fun, bi);   %funcion evaluada en bi

a = ai;
b = bi;

while abs(u)<tol
    p = a-u*(b-a)/(v-u);
    w = subs (fun, p);
    if u*w < 0
        a = ai;
        b = p;
    else
        a = p;
        b = bi;
    end
    u = subs(fun, a);
    v = subs(fun, b);
end


F = 1;
Ai = (F*0.0046)/(F+p*(1.65-1));
Bi = Ai*1.65;

Ci = (F*0.8345)/(F+p*(1.80-1));
Di = Ci*1.80;

Ei = (F*0.0381)/(F+p*(0.94-1));
Fi = Ei*0.94;

Gi = (F*0.0163)/(F+p*(0.55-1));
Hi = Gi*0.55;

Ii = (F*0.0050)/(F+p*(0.4-1));
Ji = Ii*0.4;

Ki = (F*0.0074)/(F+p*(0.38-1));
Li = Ki*0.38;

Mi = (F*0.0287)/(F+p*(0.22-1));
Ni = Mi*0.22;

Oi = (F*0.0220)/(F+p*(0.14-1));
Pi = Oi*0.14;

Qi = (F*0.0434)/(F+p*(0.09-1));
Ri = Qi*0.09;

Liquido = [Ai;Ci;Ei;Gi;Ii;Ki;Mi;Oi;Qi];
Vapor = [Bi;Di;Fi;Hi;Ji;Li;Ni;Pi;Ri];
disp('  Componente               LIQUIDO(Xi)                            VAPOR(Yi)');
disp(['Oxigeno',Ai,Bi;'Metano',Ci,Di;'Etano',Ei,Fi;'Propano',Gi,Hi;'Butano_i',Ii,Ji;'Butano_n',Ki,Li;'Pentano',Mi,Ni;'Hexano',Oi,Pi;'Heptano',Qi,Ri]);