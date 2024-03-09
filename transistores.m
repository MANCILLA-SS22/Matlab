Rc = 6.6e3;
Re = 3.6e3;
Rb = 38.9e3;
hie = 4.52e3;
hfe = 160;

Av = -( (hfe*Rc)/(hie + Re*(hfe + 1)) );
Zo = Rc;
Avl = ( 1/( (1/Rc) + (1/Zo)))/Re;

x = ((Rb*hie)*(hie^2 + (hie*Re)*(hfe + 1)));
y = (Rb + hie)*(hie^2 + (hie*Re)*(hfe + 1)) - (hfe + 1)*(Rb*Re*hie);
Zi = x/y

Ci = 1/(100*(50 + 71e3));
Co = 1/(10*(Zo*2));