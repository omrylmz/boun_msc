clc,clear all;
syms ksi phi
Ry(ksi) = [cos(ksi) 0 sin(ksi); 0 1 0; -sin(ksi) 0 cos(ksi) ];
Rx(phi) = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

R(ksi, phi) = Rx(phi)*Ry(ksi);
double(R(pi/6, pi/4))