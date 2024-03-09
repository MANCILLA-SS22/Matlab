clc;
clear all;
close all;

imdata = imread('death.jpg');
figure(1)
set( figure(1), 'color', 'w');
subtitle('Transformada de Fourier bidimensional') %Creacion de la primer imagen
subplot(3,2,1); imshow(imdata);
title('Imagen original');

%Imagen en blanco y negro
imdata = rgb2gray(imdata);
subplot(3,2,2);
imshow(imdata); title('Imagen en blanco y negro');

%Ft de la imagen
F = fft2(imdata);
S = abs(F);
subplot(3,2,3);
imshow(S,[]); title('FT de la imagen');

Fsh = fftshift(F);%FT centrado

%FT log
S2 = log(1+abs(Fsh));%Aplicar la tranformada logaritmica
subplot(3,2,4);
imshow(S2,[]);
title('FT log')