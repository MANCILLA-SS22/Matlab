function myFD(n, eps, dt)

clc
iter=2500;
dx = 2/(n-1);
x = -1:dx:1;
 
A = zeros(n);
cf1 = eps*(dt/dx)^2;


for i=2:n-1
A(i,i) = 2*cf1+1;
A(i,i-1) = -cf1;
A(i,i+1) = -cf1;
end

A(1,1) = 2*cf1+1;
A(n,n) = 2*cf1+1;
A(1,2) = -2*cf1;
A(n,n-1) = -2*cf1;

B=rand(n,1)*2-1;

for j=1:iter
C=A\(B+dt*B-dt*B.^3);
end

B=C;
plot(x,C)
axis([-1 1 -1 1])
grid on
pause(0.0001)

end