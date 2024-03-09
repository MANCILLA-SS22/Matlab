function [L, U, X]=myLU1()
clc
%Sistema Ax=b
a1=[120 -90 0];    %Primer renglon
a2=[-90 120 -30];    %Segundo renglon
a3=[0 -30 30];     %Tercer renglon

A=[a1; a2; a3];   %Matriz de coeficientes A
b = [19.62 ; 29.43 ; 24.525];  %Matriz de incognitas
L=eye(size(A));
U=zeros(3);

for i=1:3
    for j=i+1:3
        L(j,i)=A(j,i) / A (i,i); %L
            for n=i+1:3
                %R2=R2-(0.1)(R1/0.2)
                A(j,n)=A(j,n)-L(j,i)*A(i,n); 
            end
    end
    for n=i:3 
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