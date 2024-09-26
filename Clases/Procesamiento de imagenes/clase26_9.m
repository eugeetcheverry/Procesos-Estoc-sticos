img = imread('img_01.jpg'); %Abro imagen
img_gris = rgb2gray(img); %Paso a escala de grises
data = double(img_gris); %Convierto el dato a double
tira = data(:); %Aplano la matriz
X1 = tira(1:end-1); %Accedo a la primera columna
X2 = tira(2:end);%Accedo a la segunda columna
X = [X1, X2];
figure; %Grafico de dispersion
scatter(X1, X2, 1, 'filled');
title('Grafico de dispersion');
xlabel('X1');
ylabel('X2');
grid on;

cov_X = cov(X); %Matriz covarianza de X
[eig_vec, eig_val] = eig(cov_X); %Obtengo auntovalores y autovectores 
% Ordenar los autovalores de mayor a menor
[eig_val_ordenados, idx] = sort(diag(eig_val), 'descend');
eig_vec_ordenados = eig_vec(:, idx);

%Proyecto 
Y = X * eig_vec_ordenados;

figure;
scatter(Y(:,1), Y(:,2), 1, 'filled');
title('Grafico de dispersion de las proyecciones en Y por PCA');
xlabel('componente principal 1');
ylabel('componente principal 2');
grid on;



%img_out = reshape(XR,[fil, col]);%Rearmo la imagen
%imshow(unit8(img_out)) %Muestro la imagen
