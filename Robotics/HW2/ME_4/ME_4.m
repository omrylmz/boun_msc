clc, clear all;
syms theta1 theta2 theta3
L1 = 4; L2 = 3; L3 = 2;
T0_1(theta1) = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0;
                0 0 1 0; 0 0 0 1];
T1_2(theta2) = [cos(theta2) -sin(theta2) 0 L1; sin(theta2) cos(theta2) 0 0;
                0 0 1 0; 0 0 0 1];
T2_3(theta3) = [cos(theta3) -sin(theta3) 0 L2; sin(theta3) cos(theta3) 0 0;
                0 0 1 0; 0 0 0 1];
T3_H = [1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];

fprintf('----------------------------------------------------------------\n');
fprintf('b) i)\n');
[Q1,Q2] = ME_4b([1 0 0 9; 0 1 0 0; 0 0 1 0; 0 0 0 1]);
Q1/pi*180, Q2/pi*180
fprintf('Forward kinematics for first set of angles:');
double(T0_1(Q1(1))*T1_2(Q1(2))*T2_3(Q1(3))*T3_H)
fprintf('Forward kinematics for second set of angles:');
double(T0_1(Q2(1))*T1_2(Q2(2))*T2_3(Q2(3))*T3_H)

fprintf('----------------------------------------------------------------\n');
fprintf('   ii)\n');
ME_4b([0.5 -0.866 0 7.5373;0.866 0.6 0 3.9266; 0 0 1 0; 0 0 0 1]);
fprintf('r11 and r22 are different which is impossible to realize.\n');

fprintf('----------------------------------------------------------------\n');
fprintf('   iii)\n');
[Q1,Q2] = ME_4b([0 1 0 -3; -1 0 0 2; 0 0 1 0; 0 0 0 1]);
Q1/pi*180, Q2/pi*180
fprintf('Forward kinematics for first set of angles:');
double(T0_1(Q1(1))*T1_2(Q1(2))*T2_3(Q1(3))*T3_H)
fprintf('Forward kinematics for second set of angles:');
double(T0_1(Q2(1))*T1_2(Q2(2))*T2_3(Q2(3))*T3_H)

fprintf('----------------------------------------------------------------\n');
fprintf('   iv)\n');
ME_4b([0.866 0.5 0 -3.1245; -0.5 0.866 0 9.1674; 0 0 1 0; 0 0 0 1]);
fprintf('No real angles can realize the end effector configuration.\n');
fprintf('----------------------------------------------------------------\n');
