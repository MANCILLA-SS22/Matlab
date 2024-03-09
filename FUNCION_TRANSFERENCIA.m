clc
clear all
format short
 
%GRAFICA 
Gs=tf([1.6044],[1 0.5459])
rlocus(Gs), grid on, hold on, xlabel('Eje real'), ylabel('eje imaginario')

%SS = [1 2.6];
%ss = [1 3.6];
%s  = [1 4.6];
%a = roots(SS)

%TT = [1 2.6];
%tt = -[0 2 4];
%u = conv(SS,ss);
%U = conv(TT,tt);
%v = u - U;
%V = v/v(1);

