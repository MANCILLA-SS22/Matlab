%METODO SOR
function [iter, w, x] = myIter2(n, error)
clc
syms x
% w=2/(1+(1-sqrt(1-(p(Tf))^2)))
%Tf=(D^-1)*(L+u)
%h(i,j)=1/(i+j-1)
n=input('\nIngrese el tamaño n de la matriz de Hilbert: '); 
error=input('\nIngrese el error deseado : ');
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

H;
B;
L;
U;
D;
I;

D1=D^-1;
Tj=(D1)*(L+U)
S=det(Tj-x*I)
R=vpasolve(S)

pTj1=R(1,1);
for (i=1:1:size(R)) 
    
    pTj2=R(i,1);
    if (abs((abs(pTj1)-1))>(abs(abs(pTj2)-1)))
    pTj1=pTj2;
    end
    
end

pTj1
pTj=(pTj1)^2;

w=2/(1+sqrt((1-pTj)));

% PARTE CALCULO DE x Y iter
omega=w;
epsilon=error;
Error=100;
Iteration=0;
x0=B;
x=x0;
x=x(:);B=B(:);
B=compactstorage(H);
dim=size(B);
while Error>epsilon
    Iteration=Iteration+1;
    temp = x;
     for i=1:length(x)
        before = 0;
        for j=1:(i-1)
            if dim(2)>=i+1-j 
                before = before + B(j,i+1-j)*x(j);
            end;
        end;
        after = 0;
        for j=(i+1):length(x)
            if dim(2)>=j+1-i 
                after = after + B(i,j+1-i)*x(j);
            end;
        end
        x(i) = (omega/B(i,1))*(B(i)- before - after) + (1-omega)*x(i);
    end;
Error = norm(x-temp);
end;

function B = compactstorage(H)
    dim=size(H);
    c=find(H(1,1:dim(1))~=0);
    B=zeros(dim(1),c(end));
    n=dim(1);p=c(end)-1;
    for i=1:n
        if i<=n-p
            for j=i:p+i
            B(i,j-i+1)=H(i,j);
            end
        else 
            for j=i:n
            B(i,j-i+1)=H(i,j);
            end
        end
    end
end
 iter=Iteration
 x
 w
 clear all;
end