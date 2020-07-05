clc,clear all;
syms theta
Rz(theta) = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];

T_a_b = [[double(Rz(pi)) [3; 0; 0]]; [0 0 0 1]]