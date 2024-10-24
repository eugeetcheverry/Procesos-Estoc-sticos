%Sea un proceso aleatorio ESA, gaussiano blanco V(n)~N(0,4) de largo N=1000.
%1. Estime la función de autocorrelación RV(k) del proceso V(n) y grafíquela para
%-N < k < N.. Ayuda: use xcorr(v, ‘biased’).

N = 1000;

Z = randn(N, 1);

V = 2*Z;

Rv_biased = xcorr(V, 'biased');
[y, x] = periodogram(V);

k = 1-N : N-1; 

figure();
hold on;
plot(k, Rv_biased, 'DisplayName','Rv sesgado');
plot(x, y, 'DisplayName','periodograma');
title('Rv comparado periodograma');
legend();
hold off;




