%{
x = linspace(0, 2, 100); % genera puntos equiespaciados
f = raylrnd(0.5 , 1 , 100); % Función de densidad
f1= raylpdf(x, 0.5);%aca va con la pdf para que se grafique continua
figure;
plot(x , f1);
histogram(f , 10 , 'normalization' , 'pdf');

figure;
histogram(f , 30 , 'normalization' , 'pdf');

figure; 
f2 = raylrnd(0.5 , 1 , 10000); % Función de densidad
histogram(f2 , 30 , 'normalization' , 'pdf');
%}

u= unifrnd(0 ,1 , 1 , 10000);

x = -(log(1 - u))/0.5; %te da los valores de la funcion


histogram(x , 30 , 'normalization' , 'pdf');%estimo la densidad


mean(x) %media 
var(x) %varianza

x3 = linspace(0, 3, 100); % Dominio de la función
f = exppdf(x3, 2); 
plot(f , x3);






