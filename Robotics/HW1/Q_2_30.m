clc,clear all;
syms theta beta
Rz(theta) = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
Ry(beta) = [cos(beta) 0 sin(beta); 0 1 0; -sin(beta) 0 cos(beta) ];

T_a_b = [[double(Rz(pi)) [3; 0; 0]]; [0 0 0 1]];
R_b_c = Rz(7*pi/6)*Ry(pi/2);
T_b_c = [double(R_b_c) [0; 0; 2]; [0 0 0 1]];
T_a_c = T_a_b*T_b_c;
fprintf('T_c_a = inv(T_a_c)\n');
T_c_a = inv(T_a_c)