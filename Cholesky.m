
function [L, X]=mychol()
clc
a = [4 1 1 1; 1 3 0 -1; 1 0 2 1; 1 -1 1 4];
b = [2;2;1;1];
L=zeros(4);     
Lt=zeros(4);

% l(k,i)=(a(k,i)-sum_j^i l(i,j)*l(k,j))/l(i,i)
% k - Renglones
% i - Columnas
%Ax=b
%A=L*L^t
%L*L^tx=b
%Y=(L^-1)b
%Ltx=Y
%x=(Lt^-1)(Y)

for(k=1:1:4)
    for(i=1:1:4)
        sum=0;
        sum1=0;
       
        for(j=1:1:i-1)
            sum= sum+L(i,j)*L(k,j);
        end
        for (j=1:1:k)
           sum1=sum1+L(k,j)^2;
        end
        
        if (i==k)
            L(k,k)=sqrt(a(k,k)-sum1);
        end
        if(i<k)
           L(i,k)=0; 
        end
        
        L(k,i)=(a(k,i)-sum)/L(i,i);
    end    
end

for(k=1:1:4)
    
    for (t=1:1:4)
        Lt(k,t)=L(t,k);
    end    
end
Lt
Y=(L^-1)*b;
X=(Lt^-1)*Y;
disp('Matriz L: ');
disp('L= ');
disp(L);
disp('Soluci�n del sistema: ');
disp(X);
clear

end                                                                  