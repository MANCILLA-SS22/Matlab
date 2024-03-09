clc
format long 
clear all 
hold on
grid on

%Datos establecidos para las medidas de estaturas de estudiantes en una escuela
x = [1:100];
y = [1.75 1.73 1.71 1.54 1.77 1.34 1.71 1.69 1.59 1.53 1.65 1.57 1.57 1.71 1.65 1.60 1.66 1.51 1.59 1.46 1.77 1.56 1.61 1.62 1.58 1.61 1.53 1.42 1.72 1.61 1.63 1.47 1.64 1.55 1.57 1.71 1.57 1.55 1.35 1.57 1.78 1.47 1.61 1.58 1.83 1.76 1.61 1.57 1.66 1.65 1.71 1.57 1.44 1.54 1.61 1.48 1.70 1.63 1.70 1.66 1.72 1.36 1.74 1.62 1.74 1.53 1.60 1.42 1.77 1.65 1.62 1.45 1.65 1.71 1.50 1.48 1.61 1.45 1.70 1.43 1.53 1.53 1.81 1.90 1.57 1.62 1.65 1.63 1.60 1.64 1.61 1.78 1.52 1.60 1.65 1.57 1.64 1.48 1.64 1.60];
z = linspace(1,5,100); 

%Se obtiene el polinomio de interpolacion de grado 20
a = linspace(1,5,20);
b = polyfit(x,y,20);
c = polyval(b,a);

%Se obtiene la spline cubica con los valores obtenidos
f = polyfit(a,c,3);
h = polyval(f,a);
e = spline(a,c,z);
i = spline(a,h,z);

%Se grafican los datos establecidos y se comparan con el polinomio de grado 20 con la spline cubica obtenida
plot(x,y,'k')
plot(z,i,'r')
plot(z,e,'b')
title ('Medicion de estaruras con escala de 1 a 5');
xlabel 'Numero de alumno';
ylabel('Medida en metros                               ','Rotation',360);
legend ('Datos','Polinomio de interpolación grado 20','Spline cúbica');