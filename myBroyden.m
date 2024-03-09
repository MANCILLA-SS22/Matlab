function myBroyden
format short
clc
%Vector de respuesta inicial
X0(1,1)=1;
X0(2,1)=1;
X0(3,1)=1;
x=X0(1,1);
y=X0(2,1);
z=X0(3,1);

    %Se obtienen valores de las funciones originales
    f1=(6*x)-(2*cos(y*z))-1;
    f2=(9*y)+sqrt((x^2)+sin(z)+1.06)+0.9;
    f3=(60*z)+(3*exp(-x*y))+(10*pi)-3;
    
    %Se obtiene el Jacobiano
    J(1,1)=6;
    J(1,2)=(2*z)*sin(y*z);
    J(1,3)=(2*y)*sin(y*z);
    J(2,1)=x/sqrt((x^2)+sin(z)+1.06);
    J(2,2)=9;
    J(2,3)=cos(z)/(2*sqrt((x^2)+sin(z)+1.06));
    J(3,1)=(-3*y)*exp(-x*y);
    J(3,2)=(-3*x)*exp(-x*y);
    J(3,3)=60;
    J;
    
    Fv(1,1)=f1;
    Fv(2,1)=f2;
    Fv(3,1)=f3;
    Fv;

    %Se obtiene primera iteraci�n
    Xv=X0-(inv(J)*Fv);
    Xv;
    
    x=Xv(1,1);
    y=Xv(2,1);
    z=Xv(3,1);
    
    %Se obtiene valores de las funciones originales con los nuevos valores
    f1=(6*x)-(2*cos(y*z))-1;
    f2=(9*y)+sqrt((x^2)+sin(z)+1.06)+0.9;
    f3=(60*z)+(3*exp(-x*y))+(10*pi)-3;

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
    
    %Se obtiene nueva iteraci�n
    Xn=Xv-(A*Fn);
    Xn;
    
    %Calculo del error de primera iteraci�n
    Ln=norm(Xn);
    Lv=norm(Xv);
    E=abs((1-(Lv/Ln))*100);
    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%
   %Calculo para m�s iteraciones para llegar a un error m�s peque�o
    while(E>0.1)
        Fv=Fn;
        
        x=Xn(1,1);
        y=Xn(2,1);
        z=Xn(3,1);
    
        f1=(6*x)-(2*cos(y*z))-1;
        f2=(9*y)+sqrt((x^2)+sin(z)+1.06)+0.9;
        f3=(60*z)+(3*exp(-x*y))+(10*pi)-3;

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