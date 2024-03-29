function [M]=myMinCuad2(n)
format long
clc

X=[-2 3 5 7];
Y=[5 -1 -3 8];
n=3;
M=zeros(n+1);
for a=1:(n+n+1)
    xi(1,a)=0;
end
xi(1,1)=4;
s=0;
for a=2:(n+n+1)
    for b=1:4
        s=s + (X(1,b))^(a-1);
    end
    xi(1,a)=s;
    s=0;
end
Yi=0;
for a=1:4
    Yi=Yi + Y(1,a);
end
G=0;
for c=2:(n+1)
    for b=1:4
        G=G+(Y(1,b))*((X(1,b))^(c-1));
    end
    B(1,c)=G;
    G=0;
end
B(1,1)=9;
B=B'


for a=1:(n+1)
    for b=1:(n+1)
        M(a,b)=xi(1,b);
    end
    for a=1:(n+n)
    xi(1,a)=xi(1,a+1);
    end
end
p=inv(M)*B
fprintf('Nuestra funcion es:\n');
fprintf('(%f) + (%f)x + (%f)x^2 + (%f)x^3',p(1),p(2),p(3),p(4))
fprintf('\nLos coeficientes estan ordenados de A0 a An .... siendo A0 + (A1)x +...+(An)X^n + (An-1)X^n-1.\n');
T=polyfit(X,Y,n);
xp=linspace(-2,7,100);
yp=polyval(T,xp);
hold on
grid on
plot(xp,yp)
                                                       