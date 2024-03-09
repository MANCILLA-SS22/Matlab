clc;
clear all;

A = imread ('mucho texto.jpg'); %Cargar la imagen deseada
subplot(2,3,1:3)
imshow (A); title ('Imagen original')%mostrar imagen original

%Asignacion de la imagen en diferentes variables
Red = A;
Green = A;
Blue = A;

%-------------------------------------------------RGB
%Componente rojo de la imagen original
Red(:,:,2) = 0;
Red(:,:,3) = 0;
subplot (2,3,4)
imshow (Red); title ('Capa roja');

%Componente verde de la imagen original
Green(:,:,1) = 0;
Green(:,:,3) = 0;
subplot (2,3,5)
imshow (Green); title ('Capa verde');

%Componente azul de la imagen original
Blue(:,:,1) = 0;
Blue(:,:,2) = 0;
subplot (2,3,6)
imshow (Blue); title ('Capa azul');

%-------------------------------------------------Escala de grises
%Componente rojo en escala de gris de la imagen original
figure;
subplot (2,3,1:3)
imshow(A); title('Imagen original');

subplot (2,3,4)
imshow(A(:,:,1)); title('Capa roja escala de grises');

%Componente verde en escala de gris de la imagen original
subplot (2,3,5)
imshow (A(:,:,2)); title('Capa verde escala de grises');

%Componente rojo en escala de gris de la imagen original
subplot (2,3,6)
imshow(A(:,:,3)); title('Capa azul escala de grises');


% Intensidad Luminosa Rojo
subplot (2 ,3 ,4) ;
X = A (: ,: ,1) ;
imshow (X);
% Intensidad Luminosa Verde
subplot (2 ,3 ,5) ;
Y = A (: ,: ,2) ;
imshow (Y);
% Intensidad Luminosa Azul
subplot (2 ,3 ,6) ;
Z = A (: ,: ,3) ;
imshow (Z)
% Suma de intensidades
subplot (2 ,3 ,1:3) ;
imshow (( X + Y + Z ) /3)

%end