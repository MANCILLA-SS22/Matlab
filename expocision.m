close all
clear all
 
x=imread('cameraman.tif'); %lee la imagen 
figure,imshow(x);
F=dct2(x); %Realiza la transformada discreta de coseno bidimensional.

figure,imshow(F*0.01); %Muestra la fígura con dct2, se utiliza el valor de 0.01 para 
                       %observar como la energía es desplazada hacia el lugar donde se 
                       %localizan las frecuencias altas.
ff=idct2(F); %Aqui aplicamos la transformada inversa que nos retornada la imagen original
figure,imshow(ff/255); %muestra la idct2, se divide entre 255 debido a que el valor de 
                       % ff es de tipo double.

[r,c]=size(x);  %Se crea una matriz a partir de la imagen que cargamos
DF=zeros (r,c); %Se define DF como una matriz de R filas y C columnas 
                %e igual para DFF, IDF, IDFF.
DFF = DF;
IDF=DF;
IDFF=DF;
depth=4; 
N=8;

for i=1 : N :r
    for j= 1:N:c
        f=x(i:i+N-1,j:j+N-1);
        df=dct2(f);
        DF(i:i+N-1,j:j+N-1) = df; %Bloques de la dct
        dff =idct2(df);
        DFF(i:i+N-1,j:j+N-1)=dff; %Bloques de la idct

        df(N:-1:depth+1,:)=0;
        df(:,N:-1:depth+1)=0;
        IDF(i:i+N-1,j:j+N-1)=df; %Bloques de la dct considerando el parametro depth 
                                 %que decidirá cuántos bits mantendra después 
                                 %de que termine mi DCT
        dff=idct2(df); 
        IDFF(i:i+N-1,j:j+N-1)=dff; % Parte inversa
    end;
end;
figure,imshow(DF/255);
figure,imshow(DFF);
A=DFF/255;
figure,imshow(A)
imwrite(A,'abc1.tif');

B=IDFF/255;
imwrite(B,'abc2.tif' );
figure,imshow(B)