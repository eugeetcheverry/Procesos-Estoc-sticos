%Sean dos procesos aleatorios gaussianos blancos ESA, X(n)~N(0,20) y Y(n)~N(3,20) de
%largo N = 1000. Estime las funciones de autocorrelación RX(k) y RY(k).
%Grafique cada función comparándola con las teóricas (recuerde que R(k) = C(k) + 𝜇2),
%para los siguientes casos: 
%1. El estimador sesgado. Ayuda: xcorr(x, ‘biased’). 
N = 1000;
Z_init = randn(N, 1);

X = sqrt(20)*Z_init;
Y = sqrt(20)*Z_init + 3;
%Curvas teoricas 
R_xt = var(X) + mean(X)^2;
R_yt = var(Y) + mean(Y)^2;
%Teniendo en cuenta el estimador sesgado
R_x = xcorr(X, 'biased');
R_y = xcorr(Y, 'biased');

figure();
hold on;
scatter(N, R_xt,'DisplayName', 'Rx teorico');
plot(R_x,'DisplayName','Rx sesgado');
title('Comparaciones R_x sesgado vs. teorico');
legend();
hold off;

figure();
hold on;
scatter(N, R_yt,'DisplayName','Ry teorico');
plot(R_y, 'DisplayName', 'Ry sesgado');
title('Comparaciones R_y sesgado vs. teorico');
legend();
hold off;

%2. El estimador insesgado. Ayuda: xcorr(x, ‘unbiased’).
R_x_insesgado = xcorr(X, 'unbiased');
R_y_insesgado = xcorr(Y, 'unbiased');

figure();
hold on;
scatter(N, R_xt,'DisplayName', 'Rx teorico');
plot(R_x_insesgado,'DisplayName','Rx insesgado');
title('Comparaciones R_x insesgado vs. teorico');
legend();
hold off;

figure();
hold on;
scatter(N, R_yt,'DisplayName','Ry teorico');
plot(R_y_insesgado, 'DisplayName', 'Ry insesgado');
title('Comparaciones R_y insesgado vs. teorico');
legend();
hold off;

%3. Grafique RY(k) para el estimador insesgado multiplicado por una ventana de Bartlett vB(k) = (N – |k|) / N.
k = 1-N : N-1;
Barllet_vent = (N- abs(k'))/N;
R_y_vent = R_y_insesgado.*Barllet_vent;
figure();
hold on;
plot(R_y_insesgado,'DisplayName','Ry insesgado');
plot(R_y,'DisplayName','Ry sesgado');
plot(R_y_vent, 'DisplayName', 'Ry insesgado por ventana de barllet');
title('Comparaciones R_y insesgado vs. teorico ventana de Barllet');
legend();
hold off;



