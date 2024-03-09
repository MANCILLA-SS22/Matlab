clc; clear all; close all;
figure(1); set(figure(1),'Color','w');
x=0:1/10:1;
y=sqrt(x);
[X,Y,Z]=cylinder(y); surf(Z,X,Y);
hold on;
z=x.^2; [X,Y,Z]=cylinder(z); surf(Z,X,Y);
x0=1;y0=5;width=3.5;height=4;
set(gcf,'units','inches','position',[x0,y0,width,height]);
