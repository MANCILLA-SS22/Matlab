function [E,X]= myNRM(error)
format long
clc

%Vector de respuesta inicial
x1=0;
x2=0;
x3=0;
%Este seria el siguiente vector de respuesta al sistema
x1K=-1;
x2K=-2;
x3K=1;
%Error inicial de 100%
E=100;

while(E>1)
    x1= x1K;
    x2= x2K;
    x3= x3K;
    %funciones evaluadas
    f1 = x1.^3 + ((x1.^2)*x2) - (x1*x3) + 6;
    f2 = exp(x1) + exp(x2) - x3;
    f3 = x2.^2 - (2*x1*x3);
    %Los valores obtenidos se ingresan a un vector
    B(1,1)=-f1;
    B(2,1)=-f2;
    B(3,1)=-f3;
    B;
    
    %Se obtiene el jacobiano o matriz de coeficientes para deltasX
    A(1,1) = 3*x1^2 + 2*x2*x1 - x3;
    A(1,2) = x1^2;
    A(1,3) = -x1;
    A(2,1) = exp(x1);
    A(2,2) = exp(x2);
    A(2,3) = -1;
    A(3,1) = -2*x3;
    A(3,2) = 2*x2;
    A(3,3) = -2*x1;
    A;
    
    %Se resuelve el sistema
    C=inv(A)*B;
    C;

    deltaX1=C(1,1);
    deltaX2=C(2,1);
    deltaX3=C(3,1);
    
    %Se obtiene la nueva iteración
    x1K= x1+deltaX1;
    x2K= x2+deltaX2;
    x3K= x3+deltaX3;
    
    %Calculo del error
    LK=sqrt((x1K^2)+(x2K^2)+(x3K^2));
    L=sqrt((x1^2)+(x2^2)+(x3^2));
    E=abs((1-(L/LK))*100);
    
end
%Vector de resultado final
X(1,1)=x1K;
X(2,1)=x2K;
X(3,1)=x3K;
X;
end
