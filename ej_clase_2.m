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




