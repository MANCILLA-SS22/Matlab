% Tarea 2.1  
function [aprox1, N1, aprox2, N2] = metodoscerrados(e)

% Método de bisección

EA=e+1;
ai=1;
bi=2;
VA=0;
N1=0;
aprox1=0;
xi=(ai+bi)/2;

while (EA > e)

    fx=(xi-sqrt(3));
    
    if (fx < 0)
    
        ai=xi;
        xi=(ai+bi)/2;
        EA=(abs((xi-VA)/xi))*100;
        VA=xi;
        N1=N1+1;
    
    else
        bi=xi;
        xi=(ai+bi)/2;
        EA=(abs((xi-VA)/xi))*100;
        VA=xi;
        N1=N1+1;
    end

aprox1=xi;

end

% INCISO B

EA2=e+1;
ai2=1;
bi2=2;
VA2=0;
N2=0;
aprox2=0;
xi2=(ai2+bi2)/2;

while (EA2 > e)

    fx2=(xi2-sqrt(3));
    
    if (fx2 < 0)
    
        ai2=xi2;
        xi2=(ai2+bi2)/2;
        EA2=(abs((xi2-VA2)/xi2))*100;
        VA2=xi2;
        N2=N2+1;
    
    else
        bi2=xi2;
        xi2=(ai2+bi2)/2;
        EA2=(abs((xi2-VA2)/xi2))*100;
        VA2=xi2;
        N2=N2+1;
    end

aprox2=xi2;

end


clc
aprox1
N1
aprox2
N2
clear all
end
    