clc
%clear all
%hold on


hold on
s=tf('s');
G=zpk([], [0 -10], 10)
sisotool(G)
Gc = 20;
H=1;
Gf=feedback(Gc*G,H);

t=0:0.001:100;
r=t;

y=lsim(Gf,r,t);

figure(1)
plot(t,r,'r',t,y,'b')
grid 

figure(2)
step(Gf,1)
grid 


%Gs=tf([1.1427],[0.5721 1])
%Gc=zpk(Gs)%compensador de adelanto
%sisotool(Gc)
%grid

%func = tf([250e-3 0],[3.75e-4 250e-3 200])
%bode(func,{0,1e6}), grid on
%nyquist(func), grid on
%step(func)
%margin(func)

%num = [0 0 0 1];
%den = [1 0.8 1 0];
%nyquist(num,den)
%v = [-4 4 -4 4]; axis(v);axis('square')
%grid



%func = tf([4],[1 11 10 0])
%step(func)
%grid



%f = tf([1 1],[1 0 -.025])
%w = logspace(-1,2,100);
%bode(0.2*f,w)
%hold
%bode(0.5*f,w)
%bode(2*f,w)
%gtext('K = 0.2')
%gtext('K = 0.5')
%gtext('K = 2')
%gtext('La curva de fase es el nombre para todo valor de K')
%grid


%num = [0 1 1];
%den = [1 0 -0.25];
%w = 0.01:0.01:20;
%[re1,im1,w] = nyquist(0.2*num,den,w);
%[re2,im2,w] = nyquist(0.5*num,den,w);
%[re3,im3,w] = nyquist(2*num,den,w);
%plot(re1,im1,re2,im2,re3,im3)
%v = [-9 1 -3 3]; 
%axis(v);
%grid
%gtext('K = 0.2')
%gtext('K = 0.5')
%gtext('K = 2')
%title('Nyquist Diagram')
%xlabel('Real Axis')
%ylabel('Real Axis')


%num = [0 1 1];
%den = [1 0.0000001 -0.25];
%rlocus(num,den)
%grid
%title('Rood-Locus Plot of G(s) = K(s+1)/(s^2-0.25)')
%text(-0.06,0.166,'K=0.3')
%text(-0.1,0.43,'K=0.5')
%text(-0.25,0.58,'K=0.7')
%[K,r] = rlocfind(num,den)

%num = [0 0 0 20 20];
%den = conv([1 2 10 0],[1 5]);
%sys = tf(num,den);
%w = logspace(-1,2,100);
%bode(sys,w)
%title('bode diagram of G(s) = 20(s+1)/[s(s^2+2s+10)(s+5)]')
%[Gm,pm,wcp,wcg] = margin(sys);
%GmdB = 20*log10(Gm);
%[GmdB pm wcp wcg]
%grid




