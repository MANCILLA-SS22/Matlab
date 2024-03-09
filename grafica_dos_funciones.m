% close all
% hold on
% clc
% 
% 
% U = -2*pi:pi/100:2*pi;
% %V = (100)*(0.0025*sin(U-2.5662));
% grid on
% plot(U,V),title("VOLTAJE Y CORRIENTE CON ESCALA DE 1X10^2 EN RESISTENCIA R3")
% 
% W = -2*pi:pi/100:2*pi;
% X = 0.5404*sin(W-2.5662);
% grid on
% plot(W,X) 


close all
hold on
clc

%x = linspace(1, exp(1), 100);
x = 0 : 0.1 : 10;

func = (-x.^2 + x - 1);
grid on;
plot(x,func),title("Grafica de la integral");
%xlim([0 10]); %ylim([0 10]);