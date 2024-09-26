img = imread('img_01.jpg'); %Abro imagen
img_gris = rgb2gray(img); %Paso a escala de grises
data = double(img_gris); %Convierto el dato a double
tira = data(:); %Aplano la matriz
X1 = tira(1:end-1); %Accedo a la primera columna
X2 = tira(2:end);%Accedo a la segunda columna

figure; %Grafico de dispersion
scatter(X1, X2, 1, 'filled');
title('Grafico de dispersion');
xlabel('X1');
ylabel('X2');
grid on;

%img_out = reshape(XR,[fil, col]);%Rearmo la imagen
%imshow(unit8(img_out)) %Muestro la imagen
