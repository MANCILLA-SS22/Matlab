function [M]=myMinCuad2(n)
format long
clc
%CREACION DE VECTORES DE DATOS Y UNA MATRIZ DE COEFICIENTES
X=[-2 0 2 3 5];
Y=[-1 3 5 -1 4];
n=3;
M=zeros(n+1);

% CREACION DE VECTOR CON (Xi)^n
for a=1:(n+n+1)
    xi(1,a)=0;
end
xi(1,1)=5;

% SE LLENA CON DATOS EL VECTOR CON (Xi)^n
s=0;
for a=2:(n+n+1)
    for b=1:5
        s=s + (X(1,b))^(a-1);
    end
    xi(1,a)=s;
    s=0;
end

% SE OBTIENE Yi
Yi=0;
for a=1:5
    Yi=Yi + Y(1,a);
end

% CREACION DEL VECTOR RESPUESTAS
G=0;
for c=2:(n+1)
    for b=1:5
        G=G+(Y(1,b))*((X(1,b))^(c-1));
    end
    B(1,c)=G;
    G=0;
end
B(1,1)=1958.39;
B=B';

% CREACION MATRIZ DE COEFICIENTES
for a=1:(n+1)
    for b=1:(n+1)
        M(a,b)=xi(1,b);
    end
    
    %Aqui se van recorriendo los valores del vector (Xi)^n
    %Con el proposito de que se puedan utilizar bien en la parte de
    %xi=(1,b)
    for a=1:(n+n)
    xi(1,a)=xi(1,a+1);
    end
end

%SOLUCION AL SISTEMA DE ECUACIONES
p=inv(M)*B;
fprintf('Los coeficientes estan ordenados de A0 a An .... siendo A0 + (A1)x +...+(An)X^n + (An-1)X^n-1.\n');

% PARA GRAFICAR LOS PUNTOS Y EL POLINOMIO
T=polyfit(X,Y,n);
plot(X,Y,'r*');
xp=linspace(0,8,50);
yp=polyval(T,xp);
hold on
grid on
plot(xp,yp)