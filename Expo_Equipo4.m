close all;
clear all;
clc

%Esta funcion sirve para realizar distintas operaciones en bloque. Se extrae cada bloque distinto de una imagen y 
%la transfiere a una funcion que uno especifica para su procesamiento. Luego
%ensambla los bloques regresados para crear una imagen salida.

f1=@(block_struct)  dct2(block_struct.data) %dct2 = Realiza la transformada discreta de coseno bidimensional.
f2=@(block_struct) idct2(block_struct.data) %dict2 = Devuelve la transformada discreta inversa de coseno bidimensional.

Im=imread('46_Q320.tif'); %Se lee la imagen principal
imwrite(Im,'new.tif');    %Creamos otro formato para dicha imagen
figure,imshow(Im);        %Desplegamos la imagen pero en otro archivo con diferente nombre
title('Imagen original')  %Insertamos el titulo seleccionado

F=dct2(Im);               %Realiza la transformada discreta de coseno bidimensional de Im (imagen original).
figure,imshow(F*0.01);    %Muestra la fígura con dct2, se utiliza el valor de 0.01 para observar como la energía es desplazada hacia el lugar donde se localizan las frecuencias altas.                           
title('Transformada discreta de coseno bidimensional de x') %Insertamos el titulo seleccionado

ff=idct2(F);               %Devolvemos la transformada discreta inversa de coseno (DCT) bidimensional de F para que nos retornada la imagen original.
figure,imshow(ff/320);     %Muestra la idct2, se divide entre 320 (dimension de la imagen) debido a que el valor de ff es de tipo double.
title('Transformada discreta inversa dividida sobre 320')%Insertamos el titulo seleccionado


J=blockproc(Im,[8 8],f1) %Se procesa la imagen de la entrada de Im aplicando la funcion f1 a cada bloque distinto de tamano 8x8 y concatenando los resultado en la imagen de salida J.
depth=find(abs(J)<320)%Ahora, esta variable encuentra el valor absoluto de J, el cual debe ser menor a 320. Esto para controlar el factor de compresion.
J(depth)=zeros(size(depth))%En esta varaible a todos los valores de la varaible anterior se le asigna el valor de 0 siempre y cuando el resultado sea menor a 320.
K=blockproc(J,[8 8],f2)/320%Nuevamente, desarrollamos el metodo block_structure pero ahora con f2, el cual representa la transformada inversa del coseno discreto y lo dividimos entre 320.
figure,imshow(K);%Mostramos la figura comprimida
title('Compresion de imagen') %Insertamos titulo seleccionado

imwrite(K,'newc.tif'); %Creamos otro archivo con diferente nombre para la imagen comprimida
RelacionDeCompresion = numel(J)/numel(depth)%Se calcula el intervalo de compresion, el cual se determina por la relacion del J y depth


