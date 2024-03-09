function [L,X]=myChole()
clc
A=[6 -1 0 -2 0 0 0 0 0; -1 6 -1 0 -2 0 0 0 0; 0 -1 6 0 0 -2 0 0 0;
    -2 0 0 6 -1 0 -2 0 0; 0 -2 0 -1 6 -1 0 -2 0; 0 0 -2 0 -1 6 0 0 -2; 
    0 0 0 -2 0 0 6 -1 0; 0 0 0 0 -2 0 -1 6 -1; 0 0 0 0 0 -2 0 -1 6];  
B = [3 ; 2 ; 3 ; 1 ; 0 ; 1 ; 3 ; 2 ; 3];  
R=chol(A);
L=R';
z=(A==L*R');
disp('La matriz Lt es: ');
disp('Lt= ');
disp(R)
disp('La matriz L es: ');
disp('L= ');
disp(L)
disp('La matriz L*Lt es: ');
disp('L*Lt= ');
disp(z);

Y=(L^-1)*B;
X=(R^-1)*Y;

disp('La matriz Y es: ');
disp('Y= ');
disp(Y)

disp('La matriz X es: ');
disp('X= ');
disp(X);
end