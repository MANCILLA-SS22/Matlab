function [X]= myBroydenPracticaXXX(error)
clc
%Vector de respuesta inicial
X0(1,1)=1;
X0(2,1)=1;
X0(3,1)=1;
h=0.000001;
x=X0(1,1);
y=X0(2,1);
z=X0(3,1);

    f1=(3*x)-(cos(y*z))-0.5;
    f2=(x^2)-625*(y^2);
    f3=(exp(-x*y))+(20*z)+(((10*pi)-3)/3);

    %Se obtiene el Jacobiano
    J(1,1)=(((3*(x+h))-(cos(y*z))-0.5)-f1)/h;
    J(1,2)=(((3*x)-(cos((y+h)*z))-0.5)-f1)/h;
    J(1,3)=(((3*x)-(cos(y*(z+h)))-0.5)-f1)/h;
    J(2,1)=((((x+h)^2)-625*(y^2))-f2)/h;
    J(2,2)=(((x^2)-625*((y+h)^2))-f2)/h;
    J(2,3)=0;
    J(3,1)=(((exp(-(x+h)*y))+(20*z)+(((10*pi)-3)/3))-f3)/h;
    J(3,2)=(((exp(-x*(y+h)))+(20*z)+(((10*pi)-3)/3))-f3)/h;
    J(3,3)=(((exp(-x*y))+(20*(z+h))+(((10*pi)-3)/3))-f3)/h;
    J;
    
    Fv(1,1)=f1;
    Fv(2,1)=f2;
    Fv(3,1)=f3;
    Fv;

    %Se obtiene primera iteración
    Xv=X0-(inv(J)*Fv);
    Xv;
    
    Ln=norm(Xv);
    Lv=norm(X0);
    E=abs((1-(Lv/Ln))*100);
    
    x=Xv(1,1);
    y=Xv(2,1);
    z=Xv(3,1);
    
    %Se obtiene valores de las funciones originales con los nuevos valores
    f1=(3*x)-(cos(y*z))-0.5;
    f2=(x^2)-625*(y^2);
    f3=(exp(-x*y))+(20*z)+(((10*pi)-3)/3);

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
    
     %Calculo para más iteraciones para llegar a un error más pequeño
    while(E>0.1)
        Fv=Fn;
        
        x=Xn(1,1);
        y=Xn(2,1);
        z=Xn(3,1);
    
        f1=(3*x)-(cos(y*z))-0.5;
        f2=(x^2)-625*(y^2);
        f3=(exp(-x*y))+(20*z)+(((10*pi)-3)/3);

        Fn(1,1)=f1;
        Fn(2,1)=f2;
        Fn(3,1)=f3;
        Fn;
    
        deltaF=Fn-Fv;
        deltaF;
        
        deltaX=Xn-Xv;
        deltaX;
        
        
        A=inv(J)+((deltaX-(A*deltaF))*(deltaX')*(A))/((deltaX')*(A)*(deltaF));
        A;
       
        Xv=Xn;
        Xn=Xn-A*Fn;
    
        Ln=norm(Xn);
        Lv=norm(Xv);
        E=abs((1-(Lv/Ln))*100);
    end
    E
end