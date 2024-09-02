% H(z) = (32z^3 -24z^2 -4z)/(32z^2)

b = [0, -4, -24, 32];
a = [1, 0, 0, 32];
figure;
zplane(b, a);
title('Diagrama polos y ceros de H(Z)');