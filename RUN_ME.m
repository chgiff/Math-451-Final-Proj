%find 20 equidistant points using newton's method
n = 20;
[xk, yk] = equidistant_Newton(n);

%run animations
animate_both(xk, yk);