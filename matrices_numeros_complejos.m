clc
format short

A = [(44+21i) -(2+3i) -(40+15i); 
    -(2+3i) (64+6i) -60; 
    -(40+15i) -60 (118+3i)]

B = [360+207.846i; -415.692i;0];

fprintf('FORMA RECTANGULAR');
T = inv(A)*B

fprintf('FORMA POLAR');
U = real(T);
V = imag(T);
W = abs(T);
X = angle(T);
Y = (X)*(180/pi);
Z = [W Y];

Vpp = Z

Vrms = Z*0.707;