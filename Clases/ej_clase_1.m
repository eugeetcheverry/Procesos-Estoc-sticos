%ACTIVIDAD 1
M1 = 20;
n1 = 1:M1;
w0 = 2*pi;

X1 = sin(w0*n1*0.1);
X2 = sin(w0*n1*0.5);
X3 = sin(w0*n1*0.2);
X4 = X1 + X2 + X3;

%stem(n, X1);
%stem(n, X2);
%stem(n, X3);
%stem(n, X4);

%ACTIVIDAD 2
M2 = 10;
n2 = 1:M2;

y1 = sin(w0*n2*0.2);
Y1 = fft(y1, M2);

%plot(n2, abs(Y1), 'o-');

%ACTIVIDAD 3
h = [4, 3, 3.5, 4, 3, 2.5, 0.5, 0.3, 0.2];
n3 = 1:9;
%figure;
%stem(n3, h);
%title('Respuesta Impulsiva');

H = fft(h, 40);
%figure;
%stem(40, abs(H));
%title('FFT');

%Para graficar los polos y ceros utilizo un denominador a = 1
a = 1;
%figure;
%zplane(h, a);
%title('Polos y ceros de h(n)');

%Considere ahora una secuencia x(n) = square(2*pi*0.02*n), de largo M=100,
%como entrada del sistema LTI del punto anterior. Calcule la salida y(n) y grafique
%su respuesta en tiempo y en frecuencia. Nota: para calcular la salida utilice tanto
%conv() como filter(). 

M4 = 100;
n4 = 1:M4;
z = sqrt(w0*0.2*n4);

%Para calculat y[n] = z[n]*h[n]

y = conv(z, h);
[Y, wy] = freqz(1, y, 40); %respuesta en frec

%Rta temporal
%figure;
%stem(n4, y);
%title('Rta temporal conv(z, h)');

%Rta en frec
%figure;
%plot(wy, Y);
%title('Rta en frecuencia conv(z, h)');

%ACTIVIDAD 4
%Sea un sistema IIR h(n) definido en base a los siguientes coeficientes:
b = [3, 1.5, 2];
c = [1, -0.6];

%Graficar el módulo de la respuesta en frecuencia del sistema h(n) utilizando la
%función freqz(). Considere una cantidad adecuada de puntos para una mejor
%interpolación del gráfico en frecuencia.

[G, wg] = freqz(b, c, 40);
%figure;
%plot(abs(wg), abs(G));
%title("ABS de la rta en frec");

%Graficar polos y ceros de h(n).

%figure;
%zplane(c, b);
%title('Diagrama de polos y ceros);



