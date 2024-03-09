function [iter, w, x] = myIter1(n, error)
clc
syms x
L=zeros(n);
U=zeros(n);
D=zeros(n);
I=zeros(n); 

for (i=1:1:n) 
    
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

H
B
L
U
D
I;

D1=D^-1
Tf=(D1)*(L+U)
pTf1=det(Tf-x*I)
R=solve(pTf1)
end
