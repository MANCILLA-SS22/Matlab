 
R1 = 10E3;              %Valor de la resistencia
C1 = 0.1E-6;            %Valor del capacitor
TAU = R1*C1;            %Valor de Tau
num = 1/TAU;            %Recíproco de Tau
f1 = tf([num],[1 num]); %Función de transferencia

t = [0:0.00001:0.01];   %Valor de tiempo

ye = step(f1,t);  %Respuesta a un escalon unitario
plot(t,ye);
title ('Respuesta a un escalon unitario');
xlabel ('tiempo(seg)');
grid;

yi = impulse (f1,t);  %Respuesta a un impulso
plot (t,yi);
title ('Respuesta a un impulso');
xlabel ('tiempo(seg)');

ramp = t;
yr = lsim (f1,ramp,t); %Respuesta a una rampa
plot (t,yr);
title ('Respuesta a una rampa');
xlabel ('tiempo(seg)');
grid;
