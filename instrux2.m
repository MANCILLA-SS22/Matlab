K = 1:0.05:4;
a = 0.4:0.05:4;
t = 0:0.1:5;
x = 1.9:0.1:5;
g= tf([1.2],[0.36 1.86 2.5 1]);
k = 0 ;
for i = 1:60;
for j = 1:72;
gc = tf( K(i)*[1 2*a(j) a(j)^2],[1 0] );
G = gc*g/(1+gc*g);
y = step(G,t);
z = step(G,x);
mz = max(z);
mx = min(z);
m = max(y);
if m > 1.02
if m < 1.10
k = k+1;
solution(k,:)=[K(i) a(j) m] ;
if mz > 0.98
if mz < 1.02
if mx > 0.98
if mx < 1.02
hold on
step(G,t)
grid
end
end
end
end
end
end
end
end