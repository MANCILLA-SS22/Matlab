function [E,X]= myNRM_examen(error)
format short
clc

%Vector de respuesta inicial
x1=0;
x2=0;
x3=0;
%Este seria el siguiente vector de respuesta al sistema
x1K=1;
x2K=-0.7573;
x3K=0.8301;
%Error inicial de 100%
E=50;

while(E>1)
    x1= x1K;
    x2= x2K;
    x3= x3K;
    %funciones evaluadas
    f1= 10*x1-2*x1^2+x2-2*x3-5;
    f2= 8*x2^2+4*x3^2-9;
    f3= 8*x2*x3+4;
    %Los valores obtenidos se ingresan a un vector
    B(1,1)=-f1;
    B(2,1)=-f2;
    B(3,1)=-f3;
    B;
    
    %Se obtiene el jacobiano o matriz de coeficientes para deltasX
    A(1,1)= 10-4*x1;
    A(1,2)= 1;
    A(1,3)= -2;
    A(2,1)= 0;
    A(2,2)= 16*x2;
    A(2,3)= 8*x3;
    A(3,1)= 0;
    A(3,2)= 8*x3;
    A(3,3)= 8*x2;
    A;
    
    %Se resuelve el sistema
    C=inv(A)*B;
    C;

    deltaX1=C(1,1);
    deltaX2=C(2,1);
    deltaX3=C(3,1);
    
    %Se obtiene la nueva iteración
    x1K= x1+deltaX1
    x2K= x2+deltaX2
    x3K= x3+deltaX3
    
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