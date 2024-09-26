%tengo y[n] = (B^n * a1^n + B^n * a2d(n-l))*x[n]
%Grafico h[n] para B = 0.5, a1 = 0.2, a2 = -3 y l = 2

n = linspace(1, 10, 10);
g = (0.5).^n;
z = (0.2).^n + -3*(n == 2); %Delta en n = 2
h = conv(g, z);
n_conv = 0:(length(h) - 1);
figure;
stem(n_conv, h);
title('Respuesta al impulso h[n]');

%Para el primer caso, obtenga y(n) cuando x(n) = δ(n + 3).
