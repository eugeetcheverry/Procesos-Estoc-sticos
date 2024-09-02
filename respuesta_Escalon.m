%% primer caso 
NUM = [32 , 8 , 49];
DEN = [1 , 2 , 1];

H = tf(NUM ,DEN)%con esto puedo generar una funcion de transferencia, le paso el numerador y el denominador

figure;

impulse(H) %genera la respuesta al impulso y la grafica
grid on;

%% segundo caso
NUM = [1 , 3];
DEN = [1 , 4 , 5 , 2];

H = tf(NUM ,DEN)

figure;

impulse(H) %genera la respuesta al impulso y la grafica
grid on;

