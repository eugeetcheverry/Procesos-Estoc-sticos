%ACTIVIDAD 1
%Genere N experimentos de una variable aleatoria Rayleigh con parámetro b = 0.5.
%Grafique su histograma para los siguientes parámetros:
%1. N = 100, bins = 10
%2. N = 100, bins = 30
%3. N = 10000, bins = 30

%Defino variable rayleigh
x1 = raylrnd(0.5, 1, 100);
x2 = raylrnd(0.5, 1, 100);
x3 = raylrnd(0.5, 1, 10000);

figure;
histogram(x1, 10);
title('Rayleigh N=100, bin = 10')

figure;
histogram(x2, 30);
title('Rayleigh N=100, bin = 30')

figure;
histogram(x3, 30);
title('Rayleigh N=10000, bin = 30')

%ACTIVIDAD 2
%Sea x una variable aleatoria exponencial, X ∼ Exp(λ), de parámetro λ = 0.5
%1. Genere N = 104 muestras de X (usando el método de transformación inversa).
%2. Estime la media y la varianza muestrales de X y comparelas con las
%teóricas (𝜇 = 1/λ, 𝜎2 = 1/λ2).
%3. Construya el histograma de las muestras de X. Normalice el histograma
%para que tenga área 1. Compare la función obtenida con la función de
%densidad de probabilidad teórica. 


%Metodo de la transformada inversa
%Genero una muestra de la distribucion uniforme
U1 = rand(1, 104);
lambda = 0.5;
%Tomo la transgormacion inversa de una exp
X = -log(1-U1)/lambda;

figure;
histogram(X, 30);
title('Histograma X con metodo de transformacion inversa');

%Calculo de media y var muestral y teorica
%Muestral
media_muestral = mean(X);
var_muestral = var(X);

%Teorica
media_teorica = 1/lambda;
var_teorica = media_teorica^2;

fprintf('Media muestral: %f\n', media_muestral);
fprintf('Media teórica: %f\n', media_teorica);
fprintf('Varianza muestral: %f\n', var_muestral);
fprintf('Varianza teórica: %f\n', var_teorica);

%ACTIVIDAD 3
%Genere N = 200 muestras para definir los siguientes vectores aleatorios.:
%1. Para el vector U = [U1 U2]T , genere dos variables uniformes, U1~ U(0;2)
%y U2~ U(0;3).
%2. Para el vector X = [X1 X2]T genere muestras de las variables X1y X2 a partir de U1
% y U2, tal que X1= 0.5 U1 – 0.3 U2 y X2 = 0.7 U1 + 0.2 U2.
%3. Para el vector Y = [Y1 Y2]T, genere muestras de las variables Y1
% y Y2 a partir de U1 y U2, tal que Y1 = 1.2 U1 – 0.1 U2
%y Y2 = U1 + 0.1 U2

%Haga el gráfico de dispersión (ej: scatter(u1, u2)) y calcule el coeficiente de correlación
%para cada uno de casos.
%Nota: defina el límite de los ejes del gráfico con axis([-1 3 -1 3] ).

N = 200;
U2 = unifrnd(0, 2, 1, N); 
U3 = unifrnd(0, 3, 1, N);

U = [U2, U3];

figure;
scatter(U2, U3, 'filled');  % 'filled' para rellenar los puntos
axis([-1 3 -1 3]);  % Definir límites de los ejes
title('Gráfico de Dispersión de U2 vs U3');
xlabel('U2');
ylabel('U3');

correlacion = corrcoef(U2, U3);

fprintf('Coeficiente de correlación entre U2 y U3: %f\n', correlacion(1,2));

Y1 = 0.5*U2 - 0.3*U3;
Y2 = 0.7*U2 + 0.2*U3;
Y = [Y1, Y2]

figure;
scatter(Y1, Y2, 'filled');  % 'filled' para rellenar los puntos
axis([-1 3 -1 3]);  % Definir límites de los ejes
title('Gráfico de Dispersión de Y1 vs Y2');
xlabel('Y1');
ylabel('Y2');

correlacion1 = corrcoef(Y1, Y2);

fprintf('Coeficiente de correlación entre Y1 y Y2: %f\n', correlacion1(1,2));


Z1 = 1.2*U2 - 0.1*U3;
Z2 = U2 + 0.1*U3;

Z = [Z1, Z2];
figure;
scatter(Z1, Z2, 'filled');  % 'filled' para rellenar los puntos
axis([-1 3 -1 3]);  % Definir límites de los ejes
title('Gráfico de Dispersión de Z1 vs Z2');
xlabel('Z1');
ylabel('Z2');
correlacion2 = corrcoef(Z1, Z2);

fprintf('Coeficiente de correlación entre Z1 y Z2: %f\n', correlacion2(1,2));

