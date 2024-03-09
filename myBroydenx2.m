function myBroyden
format short
clc
syms x y z;
%Vector de respuesta inicial
X0(1,1)=-1;
X0(2,1)=-2;
X0(3,1)=1;
x=X0(1,1);
y=X0(2,1);
z=X0(3,1);

    %Se obtienen valores de las funciones originales
    f1 = x.^3 + ((x.^2)*y) - (x*z) + 6;
    f2 = exp(x) + exp(y) - z;
    f3 = y.^2 - (2*x*z);

    %Se obtiene el Jacobiano
    J(1,1) = 3*x^2 + 2*y*x - z;
    J(1,2) = x^2;
    J(1,3) = -x;
    J(2,1) = exp(x);
    J(2,2) = exp(y);
    J(2,3) = -1;
    J(3,1) =-2*z;
    J(3,2) = 2*y;
    J(3,3) = -2*x;
    J;
    
    Fv(1,1)=f1;
    Fv(2,1)=f2;
    Fv(3,1)=f3;
    Fv;

    %Se obtiene primera iteración
    Xv=X0-(inv(J)*Fv);
    Xv;
    
    x=Xv(1,1);
    y=Xv(2,1);
    z=Xv(3,1);
    
    %Se obtiene valores de las funciones originales con los nuevos valores
    f1 = x^3 + ((x^2)*y) - (x*z);
    f2 = exp(x) + exp(y) - z;
    f3 = y^2 - (2*x*z);

    Fn(1,1)=f1;
    Fn(2,1)=f2;
    Fn(3,1)=f3;
    Fn;
    
    %Se obtiene delta F
    deltaF=Fn-Fv;
    deltaF;
    
    %Se obtiene delta X
    deltaX=Xv-X0;
    deltaX;
    
    %Se obtiene la matriz A^-1
    A=inv(J)+((deltaX-(inv(J)*deltaF))*(deltaX')*(inv(J)))/((deltaX')*(inv(J))*(deltaF));
    A;
    
    %Se obtiene nueva iteración
    Xn=Xv-(A*Fn);
    Xn;
    
    %Calculo del error de primera iteración
    Ln=norm(Xn);
    Lv=norm(Xv);
    E=abs((1-(Lv/Ln))*100);
    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%
   %Calculo para más iteraciones para llegar a un error más pequeño
    while(E>0.1)
        Fv=Fn;
        
        x=Xn(1,1);
        y=Xn(2,1);
        z=Xn(3,1);
    
        f1 = x^3 + ((x^2)*y) - (x*z)+6;
        f2 = exp(x) + exp(y) - z;
        f3 = y^2 - (2*x*z);

        Fn(1,1)=f1;
        Fn(2,1)=f2;
        Fn(3,1)=f3;
        Fn;
    
        deltaF=Fn-Fv;
        deltaF;
        
        deltaX=Xn-Xv;
        deltaX;
        Xv=Xn;
        
        A=A+((deltaX-(A*deltaF))*(deltaX')*(A))/((deltaX')*(A)*(deltaF));
        A;
    
        Xn=Xn-A*Fn;
    
        Ln=norm(Xn);
        Lv=norm(Xv);
        E=abs((1-(Lv/Ln))*100);
    end
    X=Xn;
    E
end