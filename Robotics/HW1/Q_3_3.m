clc,clear all;
fprintf('Denavit-Hartenberg Parameters');
a = num2str([0, 11, 22]');
len = size(a);
a(2, len(2)-1:len(2)) = 'L1';
a(3, len(2)-1:len(2)) = 'L2';
table([0;90;0],a,[0;0;0],['theta1*';'theta2*';'theta3*'],'VariableNames', ...
    {'alpha','a','d','theta'},'RowNames',{'1','2','3'})

syms alpha a d theta theta1 theta2 theta3 L1 L2
Rx(alpha) = [[[1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)] ...
    [0; 0; 0]];[0 0 0 1]];
Dx(a) = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Rz(theta) = [[[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1] ...
    [0; 0; 0]];[0 0 0 1]];
Dz(d) =  [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
T(alpha, a, theta, d) = Rx(alpha)*Dx(a)*Rz(theta)*Dz(d);
T_0_1 = Rz(theta1)
T_1_2 = Rx(pi/2)*Dx(L1)*Rz(theta2)
T_2_3 = Dx(L2)*Rz(theta3)

fprintf('T_B_W = T_0_3 = T_0_1 * T_1_2 * T_2_3');
T_0_3 = T_0_1*T_1_2*T_2_3