function [iter, w, x] = myIter(N, error)
clc
syms x
% w=2/(1+(1-sqrt(1-(p(Tf))^2)))
%Tf=(D^-1)*(L+u)
%h(i,j)=1/(i+j-1)
n=input('\nIngrese el tamaño de la matriz cuadrada: '); % Se le solicita al usuario introducir el tamaño de la matriz cuadrada
L=zeros(n);
U=zeros(n);
D=zeros(n);
I=zeros(n); 

for (i=1:1:n) % 
    
    for (j=1:1:n)
        
        H(i,j)=1/(i+j-1); % Matriz de Hilbert 
        
        if (i>j)
            L(i,j)=H(i,j); % Matriz Diagonal Inferior 
        end
        
        if (i<j)
            U(i,j)=H(i,j); % Matriz Diagonal Superior 
        end
        
        if (i==j)
            D(i,j)=H(i,j); % Matriz Diagonal 
            I(i,j)=1; % Matriz identidad 
        end
        
    end   
    
    B(i,1)=1; % Vector B
    
end

H;
B;
L;
U;
D;
I;

D1=D^-1
Tf=(D1)*(L+U)
pTf1=det(Tf-x*I)
R=solve(pTf1)

pTf2=R(2,1);
for (i=1:1:size(R)) 
    
    pTf3=R(i,1);
    if pTf3>pTf2
    pTf2=pTf3;
    end
    
end

pTf2
pTf=(pTf2)^2

if pTf > 1
    fprintf('Ésta raíz no se puede usar porque sino saldrá un número imaginario.\n');
else
    w=2/(1+sqrt((1-pTf)))
end

end

