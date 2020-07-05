clc,clear all;
syms phi theta
Rz(theta) = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
Rx(phi) = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

R_a_b = Rx(pi/2)*Rz(pi);
T_a_b = [double(R_a_b) [0; 4; 2]; [0 0 0 1]]