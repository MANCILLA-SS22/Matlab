function g = funciong
intervalo1=(-pi:-0.01:-2*pi);
intervalo2=(pi:0.01:2*pi);
funcionOnes=-1*ones(1,315);
intervaloCos=(-pi:0.01:pi);
funcionCos=cos(intervaloCos);
intervalo12=(pi:0.01:2*pi);
axis([-2*pi 2*pi -1.2 1.75]);
hold
title('Function g');
plot(intervalo1,funcionOnes,intervaloCos,funcionCos,intervalo2,funcionOnes)
hold
xlabel('X');
ylabel('Y');
legend('-1, x < -\pi','cos(x), \pi \geq x \geq -\pi','-1, x > \pi');
end