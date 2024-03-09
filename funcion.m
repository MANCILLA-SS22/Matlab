function Zed = myFD1 (f,g,a,b,c,n,m)   % - myfd1 es la matriz con los respectivos resultados.





f='1';              % - f=u(x,0) se entra como una cadena de carcteres.
g='-1';             % - g=ut(x,0) se ingresa como una cadena de caracteres.
a=1;                % - a y b son los extremos superiores de los intervalos [0,a] y [0,b]
b=1;               
c=1;                % - c es la constante de la ecuacion de onda.

                    


                       %Tamaño de la matriz%
n=10;               % - n y m es el numero de nodos en [0,a] y [0,b]
m=10;              



format long g;
close all;
h=a/(n-1);          %Tamaño de los saltos de distancia x, h = delta x = 0.01
k=b/(m-1);          %Tamaño de los saltos de tiempo t, , k = delta t = 0.01
alfa=c*k/h;         %Velocidad de la onda
alfa2=alfa^2;
alfa22=(alfa2)/2;
s1=1-alfa2;
s2=2*s1;
Zed=zeros(n,m);



                %se calculan las primeras filas (j-esimo y (j-1)-esimo paso)
for i=2:n-1
x=h*(i-1);
Zed(i,1)=eval(f); %f esta en funcion de x
x=h*i;
evaluar1=eval(f);
x=h*(i-2);
evaluar2=eval(f);
x=h*(i-1);
Zed(i,2)=s1*eval(f)+k*eval(g)+alfa22*(evaluar1+evaluar2);
end



                            %Calculos de las otras filas
for j=3:m
for i=2:(n-1)
Zed(i,j)=s2*Zed(i,j-1)+alfa2*(Zed(i-1,j-1)+Zed(i+1,j-1))-Zed(i,j-2);
end
end

                                    %Grafica
Zed=Zed';
figure(2),surf(Zed),title('Grafica de U=f(x,t)'),xlabel('x'),ylabel('t'),zlabel('u')