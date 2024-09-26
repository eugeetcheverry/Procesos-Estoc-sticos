%%  item a
%defino mis realizaciones
z1=randn(1,2000);
z2=randn(1,2000);

z=[z1 ; z2];


%{
%defino la funcion de densidad conjunta
x1=-4:0.1:4 ;
x2=-4:0.1:4 ;

[X1, X2] = meshgrid(x1, x2); %esto no0 se para que es pero sirve para hacer las curvas de nivel

f = (1/(2*pi)) * exp(-0.5 * (X1.^2 + X2.^2));

figure;
scatter(z1,z2);
hold on;
contour(X1 , X2 , f , 6); %6 SON LAS CURVAS DE NIVEL
title('Curvas de nivel de la función de densidad conjunta');

figure;
subplot(1, 2, 1);  % 1 fila, 2 columnas, posición 1
histogram(z1, 30, 'Normalization', 'pdf');  
title('Histograma de z1');

subplot(1, 2, 2);  % 1 fila, 2 columnas, posición 2
histogram(z2, 30, 'Normalization', 'pdf'); 
title('Histograma de z2');
%}

%%  item b

z1=randn(1,2000);
z2=randn(1,2000);

z=[z1 ; z2];

CY = [0.7 0.8 ; 0.8 1.75];
uy= [0.8 ; 1.0];

[P,DELTA] = eig(CY); %te da la diagonalizacion de la matriz de covarianza, osea p y la A rara

A = P * sqrt(DELTA);

b= uy;

y = A * z + uy; %transformo


y1 = y(1, :);  % Primera fila (valores de y1)
y2 = y(2, :);  % Segunda fila (valores de y2)


%defino mi vector
b1=-6:0.1:6 ;
b2=-6:0.1:6 ;

[B1, B2] = meshgrid(b1, b2); %te genera el grid para despues hacer las curvas de nivel

Y=[B1(:) B2(:)]';

%defino la conjunta con la formula
fy = (1/(2*pi*sqrt(det(CY)))) * exp(-0.5 * sum((Y - uy) .* (inv(CY) * (Y - uy)), 1));
fy = reshape(fy, size(B1));

figure;
scatter(y1,y2); %HAGO UN grafico de dispersion de las va transformadas
hold on;
contour(B1 , B2 , fy , 6); %6 SON LAS CURVAS DE NIVEL
title('Curvas de nivel de la función de densidad conjunta');
%se ve que al transformar cambia el angulo del grafico

figure;
subplot(1, 2, 1);  % 1 fila, 2 columnas, posición 1
histogram(y1, 30, 'Normalization', 'pdf');  
title('Histograma de z1');

subplot(1, 2, 2);  % 1 fila, 2 columnas, posición 2
histogram(y2, 30, 'Normalization', 'pdf'); 
title('Histograma de z2');



%% actividad 2
ux= [0.8 ; 1];
cx = [0.7 0.9 ; 0.9 1.75];

z = randn(2, 2000);  % Generación de dos vectores normal estándar
[P, DELTA] = eig(cx);  % Diagonalización de cx
AX = P * sqrt(DELTA);   % Transformación a la que queremos
X = AX * z + ux;  % Generación del vector X normal(ux , cx)

varx_1 = X(1, :);  
varx_2 = X(2, :); 

%Luego lo paso a una normal estandar
%LE APLICO LA TRANSFORMACION PARA PASAR A UNA NORMAL(0 ,i)

AY = inv(sqrt(DELTA)) * P' ;

y = AY * (X - ux);

vary_1 = y(1, :);  % Primera fila (valores de y1)
vary_2 = y(2, :);  % Segunda fila (valores de y2)

figure;
subplot(1, 2, 1);  % 1 fila, 2 columnas, posición 1
scatter(vary_1 , vary_2);

subplot(1, 2, 2);  % 1 fila, 2 columnas, posición 2
scatter(varx_1 , varx_2);

%para la densidad de fy si estan descorrelacionados son independientes, por
%lo que puedo multiplicarlas

%genero mi espacio de muestras
c1 = -4:0.1:4;
c2 = -4:0.1:4;
[C1, C2] = meshgrid(c1, c2);

Y=[C1(:) C2(:)]';

%defino la matriz de covarianza
CY = [1 0; 0 1];
uy=[0 ; 0];


fy2 = (1/(2*pi*sqrt(det(CY)))) * exp(-0.5 * sum((Y - uy) .* (inv(CY) * (Y - uy)), 1));
fy2 = reshape(fy2, size(C1));

figure;
scatter(vary_1,vary_2); %HAGO UN grafico de dispersion de las va transformadas
hold on;
contour(C1 , C2 , fy2 , 20); %6 SON LAS CURVAS DE NIVEL
title('Curvas de nivel de la función de densidad conjunta fy');
%se ve que al transformar cambia el angulo del grafico

%% actividad 3
%%item 1 es el mismo de arriba

ux= [0.8 ; 1];
cx = [0.7 0.9 ; 0.9 1.75];

z = randn(2, 2000);  % Generación de dos vectores normal estándar
[P, DELTA] = eig(cx);  % Diagonalización de cx
AX = P * sqrt(DELTA);   % Transformación a la que queremos
X = AX * z + ux;  % Generación del vector X normal(ux , cx)

varx_1 = X(1, :);  
varx_2 = X(2, :); 

%Luego lo paso a una normal estandar
%LE APLICO LA TRANSFORMACION PARA PASAR A UNA NORMAL(0 ,i)

AW = inv(sqrt(DELTA)) * P' ;

w = AY * (X - ux);

varw_1 = w(1, :);  % Primera fila (valores de y1)
varw_2 = w(2, :);  % Segunda fila (valores de y2)

cw = cov(w') %las varianzas cruzadas dan 0 y las otras 1, esta bien

uw = mean(w') %aproximadamente 0
uw = uw'

w1 = -4:0.1:4;
w2 = -4:0.1:4;

[W1 , W2] = meshgrid(w1 , w2);

W_grande = [W1(:) W2(:)]'; 

%LA FUNCION DE DENSIDAD HAY QUE EVALUARLA EN LOS PUNTOS DE NUESTRA NUEVA
%MATRIZ, NO EN LOS DE w chica

fW = (1/(2*pi*sqrt(det(cw)))) * exp(-0.5 * sum((W_grande - uw) .* (inv(cw) * (W_grande - uw)), 1));
fW = reshape(fW, size(W1));


figure;
scatter(varw_1 , varw_2);
hold on;
contour(W1 , W2 , fW , 7); 
title('Curvas de nivel de la función de densidad conjunta fw');


%% actividad 4

ux_4= [0.8 ; 1]
cx_4 = [0.7 0.8 ; 0.8 1.75]

z = randn(2, 2000);  % Generación de dos vectores normal estándar
[P, DELTA] = eig(cx);  % Diagonalización de cx
AX = P * sqrt(DELTA);   % Transformación a la que queremos
X = AX * z + ux;  % Generación del vector X normal(ux , cx)

varx_1 = X(1, :);  
varx_2 = X(2, :); 



%Asumiendo que se dispone de un conjunto de N=2000 muestras del vector X,
%encuentre una transformación afín Y = AX+b tal que con las muestras de X se pueda
%generar un vector Y ~ N(𝜇Y, CY) con CY= [0.7 -0.6; -0.6 1.75] y 𝜇Y= [-0.5 1.5]T







