clc,clear all;
syms phi theta
Rz(theta) = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
Rx(phi) = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

R(theta, phi) = Rz(theta)*Rx(phi);
double(R(pi/6, pi/4))