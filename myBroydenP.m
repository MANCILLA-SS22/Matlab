function [X]= myBroydenP(error)
clc
X0(1,1)=1;
X0(2,1)=1;
X0(3,1)=1;
x=X0(1,1);
y=X0(2,1);
z=X0(3,1);
    
    J(1,1)=3;
    J(1,2)=z*sin(y*z);
    J(1,3)=y*sin(y*z);
    J(2,1)=2*x;
    J(2,2)=-1250*y;
    J(2,3)=0;
    J(3,1)=-y*exp(-x*y);
    J(3,2)=-x*exp(-x*y);
    J(3,3)=20;
    J;
    

    f1=(3*x)-(cos(y*z))-0.5;
    f2=(x^2)-625*(y^2);
    f3=(exp(-x*y))+(20*z)+(((10*pi)-3)/3);

    Fv(1,1)=f1;
    Fv(2,1)=f2;
    Fv(3,1)=f3;
    Fv;

    Xv=X0-(inv(J)*Fv);
    Xv;
    
    x=Xv(1,1);
    y=Xv(2,1);
    z=Xv(3,1);
    
    f1=(6*x)-(2*cos(y*z))-1;
    f2=(9*y)+sqrt((x^2)+sin(z)+1.06)+0.9;
    f3=(60*z)+(3*exp(-x*y))+(10*pi)-3;

    Fn(1,1)=-f1;
    Fn(2,1)=-f2;
    Fn(3,1)=-f3;
    Fn;
    
    deltaF=Fn-Fv;
    deltaF;
    
    deltaX=Xv-X0;
    deltaX;
    
    A=inv(J)+((deltaX-(inv(J)*deltaF))*(deltaX')*(inv(J)))/((deltaX')*(inv(J))*(deltaF));
    A;
    
    Xn=Xv-(A*Fv);
    Xn;
    
    Ln=norm(Xn);
    Lv=norm(Xv);
    E=abs((1-(Lv/Ln))*100);