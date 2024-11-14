%Se requiere identificar el tiempo de propagación
%de ida y vuelta entre la transmisión y recepción
%de una señal que se transmite y rebota en un
%objetivo lejano.
%Supongamos que la señal recibida se modela como un proceso aleatorio
%x(n) = s(n-2n0) + v(n), donde s(n) es una secuencia aleatoria binaria [-1, 1]
%con P(s(n)=1)=p; n0 es el tiempo de propagación que se desea medir (entre
%transmisor y objetivo, en muestras) y v(n) ruido blanco inmerso en la señal recibida.
%Utilice la correlación cruzada para determinar n0. Grafique la serie x(n), s(n) y
%la correlación cruzada. 
n = 1000;
p = 0.5;
n0 = 1;
Y = binornd(1, p, 1, n);
S = 2*Y - 1;
V = randn(n, 1);
X = zeros(1, n);
for i = 1:n
    if (i - 2*n0) < 1
        X(i) = 0;
    else
        X(i) = S(i-2*n0) + V(i); 
    end
end 

equis = -999:999
R_XS = xcorr(X, S, 'biased');
%plot(equis, R_XS) %A partir del grafico se puede distinguir n0 como la delta.
%plot(X)
%plot(Y)
%-----------------------------------------------------------------------
%Una señal de audio x(n) que se reproduce en el
%interior de un recinto, se ve alterada por efecto de
%los rebotes de la señal (ecos). Un micrófono capta
%la señal y(n) formada por múltiples versiones de
%x(n) atenuadas y desplazas.
%El recinto acústico se puede modelar como un
%sistema LTI de respuesta impulsiva h(n), con
%entrada x(n) y salida y(n).
%Nos interesa caracterizar los retardos ni
%que se producen en ese contexto (fijando
%la fuente de sonido, micrófono y recinto). Para ello vamos a usar el estimador de
%la función de correlación cruzada Rxy(k) entre x(n) e y(n).

%1. Utilice alguno de los archivos de audio en el campus (carpeta tracks) y
%simule la salida y(n) para distintas respuestas del recinto h(n) (cuyos
%coeficientes están en los archivos hall.csv, room.csv y mount.csv). 


