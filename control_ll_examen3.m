clc
clear all

A=[-2 0;1 0];
B=[1;0];
C=[0 1];
D=[0];
p=[-2+j*2 -2-j*2]
po=[-8 -8]

Co=ctrb(A,B)
rango_de_Co=rank(Co)  

K=acker(A,B,p)

Ob=obsv(A,C)
rango_de_Ob=rank(Ob) 

Ke=(acker(A',C',po))' 

A_b=[A -(B*K); Ke*C (A-B*K-Ke*C)]
B_b=[B;B]
C_b=[C zeros(size(C))]
D_b=[0]
Gf=ss(A_b,B_b,C_b,D_b)

t=0:0.001:6;
r=ones(size(t));
xo=[0 0]
xto=[-0.1 0.1]
uo=[xo xto]

[y,t,x]=lsim(Gf,r,t,uo);
x1=[1 0 0 0]*x';
x2=[0 1 0 0]*x';
x1t=[0 0 1 0]*x';
x2t=[0 0 0 1]*x';
figure(1)
plot(t,y)
grid
title('Salida y(t)')
figure(2)
plot(t,x1,t,x1t)
grid
title('Estados x1 y x1t')
figure(3)
plot(t,x2,t,x2t)
grid
title('Estados x2 y x2t')
