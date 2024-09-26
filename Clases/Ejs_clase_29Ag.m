%ACTIVIDAD 1

%Genere N experimentos de una variable aleatoria Rayleigh con parámetro b = 0.5.
%Grafique su histograma para los siguientes parámetros:

%1. N = 100, bins = 10
b=0.5;
N=100;
bins=10;
xmin=0;
xmax=1.5;
x=raylrnd(b,1,N);

x2 = linspace(xmin, xmax, N);
f = raylpdf(x2, b);

figure();hold on
histogram(x,bins,'Normalization','pdf')
plot(x2, f) 

%2. N = 100, bins = 30
N=100;
bins=30;
x=raylrnd(b,1,N);
x2 = linspace(xmin, xmax, N);
f = raylpdf(x2, b);

figure();hold on
histogram(x,bins,'Normalization','pdf')
plot(x2, f) 


%3. N = 10000, bins = 30
N=1000;
bins=30;
x=raylrnd(b,1,N);
x2 = linspace(xmin, xmax, N);
f = raylpdf(x2, b);

figure();hold on
histogram(x,bins,'Normalization','pdf')
plot(x2, f) 


%ACTIVIDAD 2

%Sea x una variable aleatoria exponencial, X ∼ Exp(λ), de parámetro λ = 0.5
%1. Genere N = 104 muestras de X (usando el método de transformación inversa).
%2. Estime la media y la varianza muestrales de X y comparelas con las teóricas (𝜇 = 1/λ, 𝜎2 = 1/λ2).
%3. Construya el histograma de las muestras de X. Normalice el histograma para que tenga área 1. Compare la función obtenida con la función de densidad de probabilidad teórica.

lambda=0.5;
N=10000;
xmin=0;
xmax=12;

u=rand(N,1);
x=-log(1-u)/lambda;

x2=linspace(xmin,xmax,N);
f = exppdf(x2, 1/lambda);

figure();hold on
histogram(x,'Normalization','pdf')
plot(x2,f)

mean_x = mean(x) 
var_x = var(x) 

Media = 1/lambda 
var = 1/(lambda^2)

%ACTIVIDAD 3

N=200;
U=rand(N,2);
U(:,1)=U(:,1)*2;
U(:,2)=U(:,2)*3;

figure();
scatter(U(:,1),U(:,2))

corr=corrcoef(U(:,1),U(:,2))

 X1= 0.5.* U(:,1)-0.3.* U(:,2);
 X2=0.7.* U(:,1)+ 0.2.* U(:,2);
 
 figure();
 scatter(X1,X2)
 
 corr2=corrcoef(X1,X2)
 
 
 Y1 = 1.2.* U(:,1)-0.1.* U(:,2);
 Y2 = U(:,1) + 0.1.* U(:,2);
 
 figure();
 scatter(Y1,Y2)
 
 corr3=corrcoef(Y1,Y2)

