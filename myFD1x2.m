% Codigo de la Práctica 7 utilizando el método de Diferencias Finitas para
% resolver la ecuación de la onda unidimensional

% Elaborado por:
% González Plascencia Daniel Alberto
% Mancilla Chávez German
% Platas Mirón José Alberto
% Rincón Arellano Bryan Joel


function myFD1

m = 100;   %Numero de columnas en matriz omega
N = 100;   %Numero de renglones en matriz omega

T = 1;      %Puntos iniciales de "x" y "t" en la red
L = 1;
alfa = 1;  %Velocidad de la onda

h = L/m;  %Tamaño de los saltos de distancia x, es decir, h = delta x = 0.01
k = T/N;  %Tamaño de los saltos de tiempo t, es decir, k = delta t = 0.01


lamda = (k*alfa)/h;

omega = zeros(m,N);

%Definiendo las condiciones de frontera

for j = 2: N        
   omega(1,j) = 0;                          
   omega(m,j) = 0;
end


omega(1,1) = 1; %f(0)
omega(m,1) = -1 ; %f(L) = %f(1)



for i = 2: m-1                                                               
   
    % Esta sección calcula los valores de f(ih), dado que f(x) (es decir,
    % u(x,0)) no está definida por una función seno o coseno, sino por los 
    % números 1 y -1, se calculan estos valores individualmente bajo la
    % multiplicacion de i*h
    
    if(i <= 50)  
        fih = 1;  %f(ih)
    end
    
    if (i > 50)
        fih = -1;
    end
    
   omega(i,1) = fih; 
        
   if(i <= 40)
      fmash = 1;  %f((i+1)h) 
   end
   
   if(i > 40)
      fmash = -1;  
   end
   
   if(i <= 60)   %f((i-1)h)
      fmenosh = 1; 
   end
   
   if(i > 60)
      fmenosh = -1; 
   end
   
   gih = 0;                                  % Condición au/at (x,0) = g(x) = 0 para 0 <= x <= 1, lo cual siempre se cumple, por lo tanto g(ih) = 0            
   
   omega(i,2) = (1-lamda*lamda)*fih + (lamda*lamda/2)*(fmash + fmenosh) + k*gih; 
   
end
        




for j = 2: N-1
   
  for i = 2: m-1
        
    omega(i, j+1)=2*(1- lamda*lamda)*omega(i,j)+(lamda*lamda)*(omega(i+1,j) + omega(i-1, j))- omega(i,j-1);   % Multiplicación de matrices
       
  end
           
end

     
                                     %se inicializan los tres conjuntos de soluciones
    u1 = zeros(m,1);    
    u2 = zeros(m,1);
    u3 = zeros(m,1);
    u4 = zeros(m,1);          
    
    j1 = 25;   %t = 0.25              %se establecen tres valores de j que representan a tres valores                  
    j2 = 50;  %t = 0.5               %distintos de t
    j3 = 75;  %t = 0.75 
    j4 = 100; %t = 1
    
    
    for i = 1: m    
                                    %se llenan las soluciones 'u' para esos valores de t
       u1(i) = omega(i,j1); 
       u2(i) = omega(i,j2);
       u3(i) = omega(i,j3);
       u4(i) = omega(i,j4);
        
    end
                                                     
    fprintf('Vector solución para t = 0.25')    %se imprimen los cuatro %vectores solución                                         
    fprintf('\n');  
                                                    
    for i = 1: m                                %imprime el vector u1
         
       fprintf('%d\t',u1(i));
       
       if(i == 25 || i == 50 || i == 75)
           
          fprintf('\n');
          
       end
       
    end
    
    fprintf('\n \n');
    
    fprintf('Vector solución para t = 0.5')
    fprintf('\n');
    
    for i = 1: m                              %imprime el vector u2
            
       fprintf('%d\t',u2(i));
       
       if(i == 25 || i == 50 || i == 75)
           
          fprintf('\n'); 
          
       end
       
    end
    
     fprintf('\n \n');
    
     fprintf('Vector solución para t = 0.75')
    fprintf('\n');
    
    for i = 1: m                               %imprime el vector u3
         
       fprintf('%d\t',u3(i));
       
       if(i == 25 || i == 50 || i == 75)
           
          fprintf('\n');
          
       end
       
    end
     
     
    fprintf('\n \n');
    
    fprintf('Vector solución para t = 1')
    fprintf('\n');
    
    for i = 1: m                             %imprime el vector u4
         
       fprintf('%d\t',u4(i));
       
       if(i == 25 || i == 50 || i == 75)
           
          fprintf('\n'); 
          
       end
       
    end
    
