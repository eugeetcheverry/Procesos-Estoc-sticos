N = 1000;
X1 = raylrnd(3, 1, N);
X2 = raylrnd(2, 1, N);
X = [X1; X2];
%Defino matrices 
B = [0.6, -0.2; 0.4, 0.7];
H = [0.6, -0.2; 0.4, 0.2];
%Tomo el cambio de variables 
V = B*X;
U = H*X;

figure;
scatter(X(1,:), X(2,:));
axis([-2 12 0 14]);
title('Dispersion X');
corrcoef(X(1,:), X(2,:))

figure;
scatter(V(1,:), V(2,:));
axis([-2 12 0 14]);
title('Dispersion V');
corrcoef(V(1,:), V(2,:))

figure;
scatter(U(1,:), U(2,:));
axis([-2 12 0 14]);
title('Dispersion U');
corrcoef(U(1,:), U(2,:))

%Obtengo las medias de cada VeA
uX = mean(X, 2)/N;
uV = mean(V, 2)/N;
uU = mean(U, 2)/N;

%Estimo covarianza
mul_vecX = (X - uX)*((X - uX)');
CX = mean(mul_vecX, 4)/(N-1);

mul_vecV = (V - uV)*((V - uV)');
CV = mean(mul_vecV, 4)/(N-1);

mul_vecU = (U - uU)*((U - uU)');
CU = mean(mul_vecU, 4)/(N-1);
%Ejercicio 3
Y1 = unifrnd(0, 2, 1, N);
Y2 = unifrnd(0, 3, 1, N);
Y = [Y1, Y2];
phi = pi/10;

R = [cos(phi), -sin(phi); sin(phi), cos(phi)];

Z = R*Y;

    




