A1=[ 4 -1 0 0; -1 4 -1 0; 0 -1 4 -1; 0 0 -1 4];
I=[-1 0 0 0;0 -1 0 0; 0 0 -1 0;0 0 0 -1];
c=[0 0 0 0; 0 0 0 0;0 0 0 0;0 0 0 0];
A=[A1 I c c; I A1 I c; c I A1 I; c c I A1];
b=[1;2;3;4;5;6;7;8;9;0;1;2;3;4;5;6];       
x=zeros(16,1);
C = [ 0.5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; 
      0 0.5 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0.5 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0.5 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0.5 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0.5 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0.5 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0.5 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0.5 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0.5 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0.5 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0.5 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0.5 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0.5 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.5 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.5];
   r = b - A*x;
   w = C*r;
   v = transpose(C)*w;   
   alfa = transpose(w)*w; %Producto punto de w

E=10;

N=0; %Contador de iteraciones

while (E>0.1)
    
 Nx = norm(x); %Normalización de vector anterior
 
 u = A*v;

 t = alfa/(transpose(v)*u) ;
 
 x = x + t*v;
 
 r = r - t*u;
 
 w = C*r;
 
 beta = transpose(w)*w;
 
 s = beta/alfa;
 
 v = transpose(C)*w + s*v;
 
 alfa = beta;
 
    
    Ny=norm(x); %Normalización de vector actual
    
    E=abs((Ny-Nx)/Ny)*100; %Calculo de error
    
    N=N+1;
end

ans