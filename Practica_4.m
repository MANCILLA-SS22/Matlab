clc, clear all
ln=@log;
x=[1:100];
y=[54, 52, 88, 45, 68, 90, 84, 71, 89, 75, 69, 77, 74, 60, 70, 71, 30, 59, 77, 58, 15, 52, 80, 74, 53, 70, 63, 90, 67, 81, 80, 70, 60, 89, 41, 63, 58, 80, 62, 64, 73, 85, 45, 56, 72, 69, 80, 24, 58, 75, 54, 94, 70, 61, 30, 54, 72, 69, 61, 72, 91, 99, 47, 51, 67, 64, 56, 60, 80, 75, 63, 66, 58, 51, 50, 68, 65, 80, 98, 62, 63, 66, 69, 56, 88, 53, 77, 52, 64, 67, 70, 87, 95, 37, 74, 85, 78, 71, 68, 84];

C=polyfit(x,y,20);

x0=linspace(1,100,20);
yy=polyval(C,x0);

xx1=linspace(1,100,100);
yy1=spline(x0,yy,xx1);
D=polyfit(x0,yy,4);

x1=linspace(1,100,20);
y1=polyval(D,x1);
yy2=spline(x1,y1,xx1);

plot(x,y,xx1,yy1,xx1,yy2),grid,hold on
title 'Precio del desayuno en 100 restaurantes diferentes';
xlabel 'Restaurante';
ylabel('Precio    ','Rotation',360);
legend ('Datos','Polinomio de interpolación grado 20','Spline cúbica');
grid