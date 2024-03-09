clc
format short

A = [(26-12i) -(13-6i);
    -(13-6i) (26-12i)];
 
B = [433.3154+76.4052i;
    -150.4889-413.4648i];


fprintf('FORMA RECTANGULAR');
T = inv(A)*B

fprintf('FORMA POLAR');
U = real(T);
V = imag(T);
W = abs(T);
X = angle(T);
Y = (X)*(180/pi);
Z = [W Y]

Vpp = Z;

Vrms = Z*0.707;