clc, clear all;
fprintf('----------------------------------------------------------------------\n');
fprintf('a)\n');
fprintf('Denavit-Hartenberg Parameters');
DH_0_3 = table([0;0;0],[0;4;3],[0;0;0],['theta1*';'theta2*';'theta3*'],'VariableNames', ...
    {'alpha','a','d','theta'},'RowNames',{'1','2','3'})

fprintf('Denavit-Hartenberg Parameters upto the End Effector');
DH_0_H = table([0;0;0;0],[0;4;3;2],[0;0;0;0],['theta1*';'theta2*';'theta3*';'      0'], ... 
    'VariableNames',{'alpha','a','d','theta'},'RowNames',{'1','2','3','H'})
fprintf('L1 = 4, L2 = 3 and L3 = 2 (m) are given link lengths.\n');

fprintf('----------------------------------------------------------------------\n');
fprintf('b)\n');
syms alpha a d theta
Rx(alpha) = [[[1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)] ...
    [0; 0; 0]];[0 0 0 1]];
Dx(a) = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Rz(theta) = [[[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1] ...
    [0; 0; 0]];[0 0 0 1]];
Dz(d) = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
T(alpha, a, theta, d) = Rx(alpha)*Dx(a)*Rz(theta)*Dz(d);

syms theta1 theta2 theta3
T_0_1(theta1) = T(0, 0, theta1, 0)
T_1_2(theta2) = T(0, 4, theta2, 0)
T_2_3(theta3) = T(0, 3, theta3, 0)
T_3_H = T(0, 2, 0, 0)

fprintf('----------------------------------------------------------------------\n');
fprintf('c)');
T_0_3(theta1, theta2, theta3) = T_0_1(theta1)*T_1_2(theta2)*T_2_3(theta3)
T_0_H(theta1, theta2, theta3) = T_0_1(theta1)*T_1_2(theta2)*T_2_3(theta3)*T_3_H

fprintf('   i)\n');
fprintf('theta = {0, 0, 0}');
T_0_3(0, 0, 0)

fprintf('   ii)\n');
fprintf('theta = {pi/18, pi/9, pi/6}');
T_0_3(pi/18, pi/9, pi/6)

fprintf('   iii)\n');
fprintf('theta = {pi/2, pi/2, pi/2}');
T_0_3(pi/2, pi/2, pi/2)
Fig_ME_3_c = imread('Fig_ME_3_c.jpg');
imshow(Fig_ME_3_c);
title('Figure Matlab Exercise 3 c)');

fprintf('----------------------------------------------------------------------\n');
fprintf('d)\n');

fprintf('----------------------------------------------------------------------\n');