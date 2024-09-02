% H(z) = (8 - 6z^(-1) + z^(-2))/8

b = [8, -6, -1];
a = [8];
figure;
zplane(b, a);
title('Diagrama polos y ceros de H(Z)');