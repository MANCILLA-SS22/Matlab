format short
clc

X0(1,1)=0;
X0(2,1)=0;
X0(3,1)=0;
x=X0(1,1);
y=X0(2,1);
z=X0(3,1);

f1=(3*x)-(cos(y*z))-0.5;
f2=(x^2)-81*(y+0.1)^2 + sin(z) + 1.06;
f3=(exp(-x*y))+(20*z)+(((10*pi)-3)/3);

    J(1,1) = 3;
    J(1,2) =  2*conj(x);
    J(1,3) =  -exp(-conj(x)*conj(y))*conj(y);
    J(2,1) =  sin(conj(y)*conj(z))*conj(z);
    J(2,2) =  - 162*conj(y) - 81/5;
    J(2,3) =  -exp(-conj(x)*conj(y))*conj(x);
    J(3,1) =  sin(conj(y)*conj(z))*conj(y);
    J(3,2) =  cos(conj(z));
    J(3,3) =  20;
    J;
    
    syms x y z
    B = [(3*x)-(cos(y*z))-0.5,(x^2)-81*(y+0.1)^2 + sin(z) + 1.06,(exp(-x*y))+(20*z)+(((10*pi)-3)/3)];
    C = [x,y,z];
    D = jacobian(B,C)';
    
    
    Fv(1,1) = f1;
    Fv(2,1) = f2;
    Fv(3,1) = f3;
    Fv;
    
    %Gradiante 
    G = 2*J*Fv;
    
    %Gradiante normalizado
    Gx = (G)/(norm(G));
    h = X0 - 0.5*(Gx)
    
f1=(3*x)-(cos(y*z))-0.5;
f2=(x^2)-81*(y+0.1)^2 + sin(z) + 1.06;
f3=(exp(-x*y))+(20*z)+(((10*pi)-3)/3);

    y = h(1,1)  
    y = h(2,1)  
    y = h(3,1)  
    
    Fn(1,1) = f1
    Fn(2,1) = f2;
    Fn(3,1) = f3;
    Fn