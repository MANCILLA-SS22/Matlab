

function [x, N]= Practica2a

A1=[ 4 -1 0 0;
     -1 4 -1 0;
     0 -1 4 -1;
     0 0 -1 4];
 
I=[ -1 0 0 0;
       0 -1 0 0;
       0 0 -1 0;
       0 0 0 -1];
      
c=[ 0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0];
   
A=[ A1 I c c;
    I A1 I c;
    c I A1 I;
    c c I A1];

b=[ 1;
    2;
    3;
    4;
    5;
    6;
    7;
    8;
    9;
    0;
    1;
    2;
    3;
    4;
    5;
    6];


x=[0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0;
   0];

   r=b-(A*x);  

   d=r; 

aprox=10;

N=0; 

while (aprox > 0.05)
    
 Nx=norm(x);

 alfa=((transpose(r))*(r))./((transpose(d))*A*d); 
    
 xG=x+(alfa*d);    
    
 rG=r-alfa*A*d;    
   
 beta=((transpose(rG))*(rG))./((transpose(r))*(r));   
   
       r=rG; 

 dG=r+beta*d;  
    
       d=dG; 
       
       x=xG; 
    
    Ny=norm(x); 
    
    aprox=abs((Ny-Nx)/Ny)*100; 
    
    N=N+1;
end
end  