%actividad 1
N = 1000;
ray1 = raylrnd(3, 1, N);
ray2 = raylrnd(2, 1, N); 

x1 = [ray1 ; ray2];

%defino la matriz b

b = [0.6 -0.2 ; 0.4 0.7];

h = [0.6 -0.2 ; 0.4 0.2];

%defino la nueva variable

v = b * x1;

v1 = v(1 , :);
v2 = v(2 , :);
%la otra


 u = h * x1;
 u1 = u(1 , :);
 u2 = u(2 , :);
%{
figure; %item a
scatter(ray1, ray2);
corrcoef(ray1, ray2)
axis([-2 12 0 14]);


figure; %item b
scatter(v1, v2);
corrcoef(v1, v2)
axis([-2 12 0 14]);


figure; %item c
scatter(u1, u2);
corrcoef(u1, u2)
axis([-2 12 0 14]);
%}
%actividad 2
media_x1 = mean(ray1)
media_x2 = mean(ray2)

aux1 = (ray1 - media_x1)
aux2 = (ray2 - media_x2)

cx_prueba = [aux1; aux2];

cx2 = 1/(N-1) * (cx_prueba * cx_prueba')

lauti = cov(x1') %con cov trasopuesta esta bien


%item 3

z1 = unifrnd(0 , 2  , 1 ,N);
z2 = unifrnd(0 , 3 , 1 , N);
zeton = [z1 ; z2];
% Y = RX

tita = pi/10;

r = [cos(tita) -sin(tita) ; sin(tita) cos(tita)];

y = r * zeton;

figure;
scatter(y(1 , :) , y(2 , :))
axis([-2 3 -1 4]) % Fijar el límite de los ejes
axis square 

figure;
scatter(zeton(1 , :) , zeton(2 , :))
axis([-2 3 -1 4]) % Fijar el límite de los ejes
axis square 

%item b

cov_y = cov(y') %matrizarda

tita = pi/4;

r1 = [cos(tita) -sin(tita) ; sin(tita) cos(tita)];

y1 = r1 * zeton;

figure;
scatter(y1(1 , :) , y1(2 , :))
axis([-2 3 -1 4]) % Fijar el límite de los ejes
axis square 

figure;
scatter(zeton(1 , :) , zeton(2 , :))
axis([-2 3 -1 4]) % Fijar el límite de los ejes
axis square 





 








