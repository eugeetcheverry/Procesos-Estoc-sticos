%Defino realizaciones
%X1 = randn(1, 10000);
%X2 = randn(1, 10000);
%X = [X1; X2];
mu_X = [1; -2];
C_x = [2  1; 1  1];

X = mvnrnd(mu_X, C_x, 10000);
%La funcion mvnrnd genera realizaciones de una distribución normal multivariante.

%Grafico realizaciones
figure;
scatter(X(1,:), X(2,:));
title('Realizaciones de X');

%Genero el plano para la curva de nivel 
[x1_grid, x2_grid] = meshgrid(linspace(-5, 5, 100), linspace(-5, 5, 100));
X_grid = [x1_grid(:)'; x2_grid(:)'];  % Crear un grid de puntos (2x10000)
%Calculo la func densidad
C_x_inv = inv(C_x);
X_cent = X_grid - mu_X;
B = sum(X_cent' .*(C_x_inv * X_cent)', 2);
fx = exp(-B/2);

fx = reshape(fx, size(x1_grid));

%Grafico curvas de nivel 
contour(x1_grid, x2_grid, fx, 10);  % 10 niveles de densidad
colorbar;
xlabel('x1');
ylabel('x2');
title('Realizaciones del vector X y curvas de nivel de f_X(x)');
