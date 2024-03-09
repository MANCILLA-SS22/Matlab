function myBroyden
format short
clc
%Valores iniciales y ecuacuiones principales del problema 
X0(1,1)=2;
X0(2,1)=2;
X0(3,1)=2;
x=X0(1,1);
y=X0(2,1);
z=X0(3,1);
f1 = (x^2)+(2*y^2)+exp(x+y)-6.1718+(x*z);
f2 = (10*y)+(y*z);
f3 = sin(x*z)+(y^2)-1.1410+x;

    %Obtenemos los las constantes de las funciones evaluadas del Jacobiano
    J(1,1) = (2*x)+exp(x+y)+1;
    J(1,2) = (4*y)+exp(x+y);
    J(1,3) = x;
    J(2,1) = 0;
    J(2,2) = 10+z;
    J(2,3) = y;
    J(3,1) = z*(cos(x*z))+1;
    J(3,2) = 2^y;
    J(3,3) = x*(cos(x*z));
    J;
    
    %A continuacion se muestra el Jacobiano
    syms x y z
    B = [(x^2)+(2*y^2)+exp(x+y)-6.1718+(x*z);(10*y)+(y*z);sin(x*z)+(y^2)-1.1410+x];
    C = [x,y,z];
    D = jacobian(B,C);
    
     
    %Aqui se evaluan los valores iniciales dentro de las funciones iniciales F(Xv)
    
    Fv(1,1) = f1;
    Fv(2,1) = f2;
    Fv(3,1) = f3;
    Fv;
    
    %Obtenemos la inversa del Jacobiano
    M = inv(J);
    M;
    
    %Obtenemos la primera primera iteracion utilizando la formula   x^k = x^k-1 - (A^k-1)^-1 * f(x^k-1)-1
    Xv = X0-(M*Fv);
    Xv;
    
    x = Xv(1,1);
    y = Xv(2,1);
    z = Xv(3,1);
     
    %Aqui evaluamos los valores de la primera iteracion Xv con las ecuaciones principales para obtener  F(Xn)
    f1 = (x^2)+(2*y^2)+exp(x+y)-6.1718+(x*z);
    f2 = (10*y)+(y*z);
    f3 = sin(x*z)+(y^2)-1.1410+x;
    
    Fn(1,1) = f1;
    Fn(2,1) = f2;
    Fn(3,1) = f3;
    Fn
    
    %Obtenemos delta X
    deltaX = Xv - X0;
    
    %Obtenemos la transpuesta de deltaX 
    T = deltaX';
    
    %Obtenemos delta F
    deltaF = Fv - Fn;
    
    %Obtebemos la matriz (A^k)^-1 
    A = M+((deltaX-M*deltaF)*(T*M))/(T*M*deltaF);
    
    %Se obtiene nueva iteración con la formula x^k = x^k-1 - A*(x^k-1)^-1 * F(x^k-1)
    Xn=Xv-(M*Fv);
    Xn;
    
    x=Xn(1,1);
    y=Xn(2,1);
    z=Xn(3,1);
    
    %Obtenemos el error de primera iteración
    %EL comando norm indica la normal de un vector, que da como resultado un escalar 
    Iv = norm(Xn);  %normal del vector de la nueva iteracion 
    I0 = norm(Xv);  %normal del vector de la primera iteracion 
    E = abs((Iv-I0)/Iv)*100;
    
        while E > 0.1
        %Se vuelven a tomar los valores de la ultima iteracion, ya que estos van a iterar y se usara otra variabla la cual vaya acumulando los resultados 
        x=Xn(1,1); 
        y=Xn(2,1);
        z=Xn(3,1);
       
        f1 = (x^2)+(2*y^2)+exp(x+y)-6.1718+(x*z);
        f2 = (10*y)+(y*z);
        f3 = sin(x*z)+(y^2)-1.1410+x;

        %Se evaluan los valores de la ultima iteracion en las mismas ecuaciones principales 
        Fv = Fn; %primer acumulador para la evaluacion del vector en las ecuacuones pruncupales
        Fn(1,1) = f1;
        Fn(2,1) = f2;
        Fn(3,1) = f3;
        Fn;
    
        deltaF = Fn-Fv;
        deltaF;
        
        deltaX = Xn-Xv;
        deltaX;
        
        A = M+((deltaX-M*deltaF)*(T*M))/(T*M*deltaF);
        A;
        
        Xv = Xn; %segundo acumulador para el vector 
        Xn = Xn-A*Fv;
      
        Iv=norm(Xn);  %normal del vector de la nueva iteracion 
        I0=norm(Xv);  %normal del vector de la primera iteracion
        Xu = Xn       ;               %Resultado de la ultima iteracion
        E  = abs((Iv-I0)/Iv)*100  ;   %Resutado del error aproximado de la ultima iteracion  
        end
     E
end