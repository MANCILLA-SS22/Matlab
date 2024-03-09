clear all
clc

%T = 0.1;
%num = [0.004837 0.004678];
%den = [1 -1.9048 0.9048];

%gz = tf(num, den, 0.1)

%step (gz, 10)
%grid

T = 1;
num = [0.368 0.264];
den = [1 -1.368 0.368];

x = tf(num, den, T)
step(x,10)