clc,clear all;
fprintf('Denavit-Hartenberg Parameters');
a = num2str([0, 0, 12]');
len = size(a);
a(3, len(2)-1:len(2)) = 'L3';
table([0;90;0],a,[0;0;0],['theta1*';'theta2*';'theta3*'],'VariableNames', ...
    {'alpha','a','d','theta'},'RowNames',{'1','2','3',})

syms alpha a d theta theta1 theta2 theta3 L3
Rx(alpha) = [[[1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)] ...
    [0; 0; 0]];[0 0 0 1]];
Dx(a) = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Rz(theta) = [[[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1] ...
    [0; 0; 0]];[0 0 0 1]];
Dz(d) =  [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
T(alpha, a, theta, d) = Rx(alpha)*Dx(a)*Rz(theta)*Dz(d);
T_0_1 = Rz(theta1)
T_1_2 = Rx(pi/2)*Rz(theta2)
T_2_3 = Dx(L3)*Rz(theta3)

Fig_3_4 = imread('Fig_3_4.jpg');
imshow(Fig_3_4);
title('Figure Exercises 3.4');