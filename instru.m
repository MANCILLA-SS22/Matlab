clc 
clear all

x = tf([2], [1 2 0]);
y = tf([5], [1 0]);
z = tf([1], [ 1 1]);
a = [x 10; y z]
b = [1 0; 0 1]
c = ((b+a*b)^(-1))*a