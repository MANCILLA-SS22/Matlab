% Tarea 2.2    Avi�a Zu�iga Mario Salvador     16212559

% (x^3)-x + e^x = 0 
% Despejando x para �ste caso x2 = (x^3)+ exp(x)

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
   
    disp('Dado que el valor en la derivada es menor que 1 s� sirve como una funci�n para encontrar la ra�z para la soluci�n.')
   
    Funcion = ((ValorI.^3)+ exp(ValorI)); 
    Error = 100;   % Error por default

    while (Error > e)
        
        ValorA = ValorI;
        ValorI = Funcion;   % El valor inicial se sustituye en la funci�n original
        Error = abs(((ValorI-ValorA)/ValorI)*100);   % Calculo del error
        Funcion = ((ValorI.^3)+ exp(ValorI));
        
    end 
    
    raiz=ValorI   %La ra�z es el �ltimo n�mero
else
    disp('Dado que el valor en la derivada es mayor que 1 NO sirve como una funci�n para encontrar la ra�z para la soluci�n.')
end
 
end