%%calculo de residuos
clear all;clc;close all
numeradory=poly([-3]);                            
denominadory=poly([-1 -1 -2]);               
[residuo,polo,independiente] = residue(numeradory,denominadory)    








%% calculo de Laplace inversa
syms s
F = 2/((s+1)*(s+2)^2);
ilaplace(F)
%ejemplo oscilador
F1=1/(s^2+2*s+1);
ilaplace(F1)
                      