% Codigo de la Pr�ctica 7 utilizando el m�todo de Diferencias Finitas para
% resolver la ecuaci�n de la onda unidimensional

% Elaborado por:
% Gonz�lez Plascencia Daniel Alberto
% Mancilla Ch�vez German
% Platas Mir�n Jos� Alberto
% Rinc�n Arellano Bryan Joel

function omega = myFD1()
m = 100;   %Numero de columnas en matriz omega
N = 100;   %Numero de renglones en matriz omega

T = 1;      %Puntos iniciales de "x" y "t" en la red
L = 1;
alfa = 1;  %Velocidad de la onda

h = L/m;  %Tama�o de los saltos de distancia x, es decir, h = delta x = 0.01
k = T/N;  %Tama�o de los saltos de tiempo t, es decir, k = delta t = 0.01


lamda = (k*alfa)/h;

for j = 1: N        
   omega(1,j) = 0;
   omega(m,j) = 0;
end

omega(1,1) = 0; %f(0)
omega(m,1) = 0 ;%f(L)

for i = 2: m
   
    % Esta secci�n calcula los valores de f(ih), dado que f(x) (es decir,
    % u(x,0)) no est� definida por una funci�n seno o coseno, sino por los 
    % n�meros 1 y -1, se calculan estos valores individualmente bajo la
    % multiplicacion de i*h
    
    if(i <= 5)  
        fih = 1;  %f(ih)
    end
    
    if (i > 5)
        fih = -1;
    end
    
   omega(i,1) = fih; 
        
   if(i <= 4)
      fmash = 1;  %f((i+1)h) 
   end
   
   if(i > 4)
      fmash = -1;  
   end
   
   if(i <= 6)   %f((i-1)h)
      fmenosh = 1; 
   end
   
   if(i > 6)
      fmenosh = -1; 
   end
   
   gih = 0;   % Condici�n au/at (x,0) = g(x) = 0 para 0 <= x <= 1, lo cual siempre se cumple, por lo tanto g(ih) = 0
   
   omega(i,2) = (1-lamda*lamda)*fih + (lamda*lamda/2)*(fmash + fmenosh) + k*gih; 
   
end
       
%PASO 5
for j = 2: N-1
    for i = 2: m-1
       omega(i, j+1) = 2*(1- lamda*lamda)*omega(i,j) + (lamda*lamda)*(omega(i+1,j)  +  omega(i-1, j)) - omega(i,j-1);   % Multiplicaci�n de matrices
    end
end
    
%PASO 6
encabezado = sprintf('i      j         x        t        omega(i,j)');              % Presentaci�n de resultados
disp(encabezado);                                                                   
for j = 1: N    
   t = j*k;
   
   for i = 1: m
       x = i*h;

       valores = sprintf('%d      %d        %.3f     %.3f     %.3f',i,j,x,t,omega(i,j));    % Primero se muestra la tabla de iteraciones, se presentan los valores de "i" y "j" 
       disp(valores);                                                                       % Junto con sus respectivos valores de "x", "t" y omega
   end                                                                                      % Finalmente, se muestra la matriz soluci�n omega de 100x100
end