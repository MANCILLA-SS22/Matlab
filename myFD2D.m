function myFD2D(n, eps, dt)

clc
iter=5000;
dx = 2/(n-1);
dy = 2/(n-1);
y = -1:dy:1;
x = -1:dx:1;
n2=n^2;

B=rand(n2,1)*2-1;
A=zeros(n2);
cf1=(eps*dt^2/dx^2)^2;

A(1,1)=4*cf1+1;
A(1,2)=-2*cf1;
A(1,1+n)=-2*cf1;
A(n2,n2)=4*cf1+1;
A(n2,n2-1)=-2*cf1;
A(n2,n2-n)=-2*cf1;

for i=2:n-1
A(i,i)=4*cf1+1;
A(i,i+1)=-cf1;
A(i,i-1)=-cf1;
A(i,i+n)=-2*cf1;
end
for i=n2-n+2:n2-1
A(i,i)=4*cf1+1;
A(i,i+1)=-cf1;
A(i,i-1)=-cf1;
A(i,i-n)=-2*cf1;
end

for i=n+1:n:n2-n+1
A(i,i)=4*cf1+1;
A(i,i+1)=-2*cf1;
if i~=n2-n+1
A(i,i+n)=-cf1;
A(i,i-n)=-cf1;
else
A(i,i-n)=-2*cf1;
end

A(i-1,i-1)=4*cf1+1;
A(i-1,i-2)=-2*cf1;
if i ~= n+1
A(i-1,i-1-n)=-cf1;
A(i-1,i-1+n)=-cf1;
else
A(i-1,i-1+n)=-2*cf1;
end
if i~=n2-n+1
for j=1:n-2
A(i+j,i+j)=4*cf1+1;
A(i+j,i+j+1)=-cf1;
A(i+j,i+j-1)=-cf1;
A(i+j,i+j-n)=-cf1;
A(i+j,i+j+n)=-cf1;
end
end
end
A=sparse(A);

for k=1:iter
C=A\(B+dt*B-dt*B.^3);
B=C;
U2=reshape(C,[n,n]);
mesh(x,y,U2);
axis([-1 1 -1 1 -1 1])
grid on
pause(0.0001)
end





end