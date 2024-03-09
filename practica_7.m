%Pruebas estables y apreciables...(n,1,.005)
%Entre más grande sea "n" mas notable es la evolución,
%Se recomienda usar n = 50.

function myFD(n,eps,dt)
%--------------------------------------------------------------------------
%Donde "n" es igual a la cantidad de puntos, "eps" es la constante de calor
%y "dt" es el intervalo de tiempo que pasa en la ecuación con cada
%iteración.
%--------------------------------------------------------------------------
clc;
iter=2500;
%--------------------------------------------------------------------------
%el numero de iteraciones puede ser incluido en los datos,peroal no ser 
%especificado lo ponemos fijo y señalado por si se quiere modificar.
%--------------------------------------------------------------------------

dx = 2/(n-1);           
x = -1:dx:1;  
%--------------------------------------------------------------------------
cf1 =eps*(dt/dx)^2;           %Constante en la ecuación 
%--------------------------------------------------------------------------                    
A=zeros(n);                   %Creando la matriz de ecuaciones

for i=2:n-1
    A(i,i) = 2*cf1+1;
    A(i,i-1) = -cf1;
    A(i,i+1) = -cf1;
    
end
%--------------------------------------------------------------------------
A(1,1) = 2*cf1+1;              % Ajustando limites
A(n,n) = 2*cf1+1;
A(1,2) = -2*cf1;
A(n,n-1) = -2*cf1;
%--------------------------------------------------------------------------
B=rand(n,1)*2-1;               %Condiciones iniciales aleatorias
%--------------------------------------------------------------------------
for j=1:iter                   %Iteraciones   
    
    C=A\(B+dt*B-dt*B.^3);      %Despeje de ecuación
%--------------------------------------------------------------------------
    
    B=C;                       %Reemplazando datos
    
%--------------------------------------------------------------------------
    
    plot(x,C)                  %Graficar
    
%--------------------------------------------------------------------------
    
    axis([-1 1 -1 1])          %La grafica tenga las cordenadas X y Y fijas
    
%--------------------------------------------------------------------------
    
    grid on                    %Cuadricula en la grafica
    
%--------------------------------------------------------------------------
    
    pause(0.0001)
    
    %Pausa para que no termine rapido el programa y visualizarcomo cambia 
    %la ecuación
%--------------------------------------------------------------------------  
end