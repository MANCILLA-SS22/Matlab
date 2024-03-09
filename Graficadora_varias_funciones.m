 close all
hold on
clc

A = -2*pi:pi/100:2*pi;
B = 0.0207*sin(A-1.1346);
grid on
subplot(3,4,1), plot(A,B), title("CORRIENTE RESISTENCIA R1")

C = -2*pi:pi/100:2*pi;
D = 2.0656*sin(C-1.1346);
grid on
subplot(3,4,2), plot(C,D),title("VOLTAJE RESISTENCIA R1")

E = -2*pi:pi/100:2*pi;
F = 0.0201*sin(E-0.8749);
grid on
subplot(3,4,3), plot(E,F), title("CORRIENTE CAPACITOR C1")

G = -2*pi:pi/100:2*pi;
H = 0.5331*sin(G-2.4457);
grid on
subplot(3,4,4), plot(G,H),title("VOLTAJE CAPACITOR C1")

I = -2*pi:pi/100:2*pi;
J = 0.0053*sin(I-2.4457);
grid on
subplot(3,4,5), plot(I,J), title("CORRIENTE RESISTENCIA R2")

K = -2*pi:pi/100:2*pi;
L = 0.5322*sin(K-2.4457);
grid on
subplot(3,4,6), plot(K,L),title("VOLTAJE RESISTENCIA R2")

M = -2*pi:pi/100:2*pi;
N = 0.0019*sin(M+0.7670);
grid on
subplot(3,4,7), plot(M,N), title("CORRIENTE INDUCTOR L1")

O = -2*pi:pi/100:2*pi;
P = 0.0115*sin(O+2.3378);
grid on
subplot(3,4,8), plot(O,P),title("VOLTAJE RESISTENCIA L1")

Q = -2*pi:pi/100:2*pi;
R = 0.0205*sin(Q-1.0168);
grid on
subplot(3,4,9), plot(Q,R), title("CORRIENTE CAPACITOR C2")

S = -2*pi:pi/100:2*pi;
T = 0.5427*sin(S-2.5876);
grid on
subplot(3,4,10), plot(S,T),title("VOLTAJE CAPACITOR C2")

U = -2*pi:pi/100:2*pi;
V = 0.0025*sin(U-2.5662);
grid on
subplot(3,4,11), plot(U,V),title("CORRIENTE RESISTENCIA R3")

W = -2*pi:pi/100:2*pi;
X = 0.5404*sin(W-2.5662);
grid on
subplot(3,4,12), plot(W,X),title("VOLTAJE RESISTENCIA R3")
