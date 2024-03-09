clc 
clear all
format short

F = 18240.6;
TF = 93.9;
XF = 0.2;
X2 = 0.6;
U1 = 3516.5;
U2 = 2440.4;
P1 = 0.68;
P2 = 0.136;
Patm = 1;
L2 = (F*XF)/X2;
V1V2 = F - L2;

%SE ASUME QUE V1 Y V2 SON IGUALES
V1 = V1V2/2;
V2 = V1;

%SIMPLIFICANDO LOS BALANCES PARA HALLAR L1 OBTENEMOS
L1 = F - V1;

%PARA HALLAR X1 SUPONEMOS QUE NO EXISTEN SOLIDOS EN EL PRODUCTO EVAPORADO
X1 = (F*XF)/L1;

%SIMPLIFICANDO LOS BALANCES PARA HALLAR L1 OBTENEMOS
L2 = L1 - V2;

%PARA HALLAR X2 SUPONEMOS QUE NO EXISTEN SOLIDOS EN EL PRODUCTO EVAPORADO
X2 = (L1*X1)/L2;

%PARA DETERMINAR LA PRESION ABSOLUTA DEL VAPOR SATURADO Po tenemos
po = 0.68;
Po = Patm + po;
ss = 101.3 * Po;

%Tenemos los valores iniciales para las siguientes variables
To = 115.19;
Ho = 2698.99;
ho = 483.32;

%PARA DETERMINAR LA PRESION ABSOLUTA DEL VAPOR SATURADO P2 obtenemos
P0 = 1 - P2;
SS = P0*101.3;

%PARA CALCUAR EL AREA DE LOS EVAPORADEORES, OBTENEMOS 
T2 = 95.95;
T1 = 107.3;
DT1 = U1;
DT2 = U2;
A = DT1/DT2;

deltaT1 = To - T1;
deltaT2 = T1 - T2;

%PARA HALLAR LOS VALORES PARA ENTALPIA TENEMOS LOS SIGUIENTES VALORES
Ha = 2698.99 ;
Hb = 483.32;
Hc = 2687.25;
Hd = 449.915;

Ho = Ha*(1000/1)*(238.845e-6/1);
ho = Hb*(1000/1)*(238.845e-6/1);
H1 = Hc*(1000/1)*(238.845e-6/1);
h1 = Hd*(1000/1)*(238.845e-6/1);

%CON LOS SIGUIENTES RESULTADOS PODEMOS DETERMINAR V0

V0 = (3.9025e6+1.0438e6-1.5328e6)/(644.64-115.44)

%El SIGUIENTE PASO ES CALCULAR EL AREA 1, POR LO QUE PRIMERO OBTENEMOS q1
q1 = V0*(Ho-ho);

A1 = q1/(U1*deltaT1)

%El SIGUIENTE PASO ES CALCULAR EL AREA 2, POR LO QUE PRIMERO OBTENEMOS q2
q2 = V1*(H1-h1);

A2 = q2/(U2*deltaT2)














