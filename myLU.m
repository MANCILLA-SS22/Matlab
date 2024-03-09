function [L, U, X]=myLU()
clc
%Sistema Ax=b
a1=[0.2 0.1 1 1 0];    %Primer renglon
a2=[0.1 4 -1 1 -1];    %Segundo renglon
a3=[1 -1 60 0 -2];     %Tercer renglon
a4=[1 1 0 8 4];        %Cuarto renglon
a5=[0 -1 -2 4 700];    %Quinto renglon
A=[a1; a2; a3; a4; a5];   %Matriz de coeficientes A
b = [1 ; 2 ; 3 ; 4 ; 5];  %Matriz de incognitas
L=eye(size(A));
U=zeros(5);

for i=1:5
    for j=i+1:5
        L(j,i)=A(j,i) / A (i,i); %L
            for n=i+1:5
                %R2=R2-(0.1)(R1/0.2)
                A(j,n)=A(j,n)-L(j,i)*A(i,n); 
            end
    end
    for n=i:5 
        U(i,n)=A(i,n); %U
    end
end
%LUx=b
%Y=Ux
%LY=b
%Ux=Y
%x=(U^-1)Y
disp('Factorización LU: ');
disp('L= ');
disp(L);
disp('U= ');
disp(U);

Y=(L^-1)*b;

X=(U^-1)*Y;

disp('La Solución al sistema es: ');
disp(X);
clear
end

