clc,clear all;
syms phi theta
Rz(theta) = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
Rx(phi) = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

R_a_b = Rx(pi/2)*Rz(pi);
T_a_b = [double(R_a_b) [0; 4; 2]; [0 0 0 1]]
R_b_c = Rx(-pi/2)*Rz(pi*143.1/180);
T_b_c = [[double(R_b_c) [3; 0; 0]]; [0 0 0 1]]
fprintf('T_a_c = T_a_b * T_b_c\n');
T_a_c = T_a_b*T_b_c