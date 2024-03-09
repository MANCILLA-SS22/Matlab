% Tarea 2.2    Aviña Zuñiga Mario Salvador     16212559

% (x^3)-x + e^x = 0 
% Despejando x para éste caso x2 = (x^3)+ exp(x)

function myFixedPoint2()
clc
syms x  % Declarando x como una variable para poder usar derivada
e=1; % Porcentaje de error a solicitar 

ValorI=1;  % Valor Inicial o X0
ValorA=0;

% Parte para comprobar convergencia
Funcion = (x^3) + exp(x); 
Derivada = diff(Funcion,x);
Convergencia = abs(subs(Derivada,ValorI));

if (Convergencia < 1)
   
    disp('Dado que el valor en la derivada es menor que 1 sí sirve como una función para encontrar la raíz para la solución.')
   
    Funcion = ((ValorI.^3)+ exp(ValorI)); 
    Error = 100;   % Error por default

    while (Error > e)
        
        ValorA = ValorI;
        ValorI = Funcion;   % El valor inicial se sustituye en la función original
        Error = abs(((ValorI-ValorA)/ValorI)*100);   % Calculo del error
        Funcion = ((ValorI.^3)+ exp(ValorI));
        
    end 
    
    raiz=ValorI   %La raíz es el último número
else
    disp('Dado que el valor en la derivada es mayor que 1 NO sirve como una función para encontrar la raíz para la solución.')
end
 
end