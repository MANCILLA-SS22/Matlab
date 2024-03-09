function [X]=myFixedPointMult(error)
clc
format long
%Inicialización de variables 
E=100;
x1=1;
x2=1;
x3=1;
x4=1;
x5=1;
x6=1;

while (E>error)
   
    %Ecuaciones
    x1N=(-log(x2/x4) + 3);
    x2N=(4-x4);
    x3N=(sqrt(2-x3)); 
    x4N=((18-x1*x2)/x6);
    x5N=(12-x2-x6);
    x6N=((7/x3)-x3);
   
    % Código para calcular la norma y el error de cada iteración 
    Lv= sqrt((x1)^2+(x2)^2+(x3)^2+(x4)^2+(x5)^2+(x6)^2);
    Ln =sqrt((x1N)^2+(x2N)^2+(x3N)^2+(x4N)^2+(x5N)^2+(x6N)^2);
    E=abs((1-(Lv/Ln))*100);
    
    % Cambio de valores a los más actuales 
    x1=x1N;
    x2=x2N;
    x3=x3N;
    x4=x4N;
    x5=x5N;
    x6=x6N;
end

X(1,1)=x1N;
X(2,1)=x2N;
X(3,1)=x3N;
X(4,1)=x4N;
X(5,1)=x5N;
X(6,1)=x6N;
X

disp('Nota: las soluciones dadas pueden ser no las correctas esto debido a que');
disp('la mayoría de las ecuaciones no cumplieron con el criterio de convergencia');
disp('y no se pudo encontrar algún otro despeje para algunas variables.');

end