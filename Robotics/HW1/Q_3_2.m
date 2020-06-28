clc, clear all;
syms alpha a d theta
Rz(theta) = [[[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1] ...
    [0; 0; 0]];[0 0 0 1]];
Dz(d) =  [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
Rx(alpha) = [[[1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)] ...
    [0; 0; 0]];[0 0 0 1]];
Dx(a) = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T(alpha, a, theta, d) = Rx(alpha)*Dx(a)*Rz(theta)*Dz(d);

syms theta1 d3 theta2 a2 a3 d4 theta4 theta5 theta6
T_0_6(theta1, d3, theta2, a2, a3, d4, theta4, theta5, theta6) = ...
    T(0, 0, 0, theta1) * T(-pi/2, 0, -d3, theta2-pi/2) ...
    * T(-pi/2, 0, a2, 0) * T(0, a3, d4, theta4) ...
    * T(pi/2, 0, 0, theta5) * T(-pi/2, 0, 0, theta6)

fprintf('In this modified manipulator, theta2 angle becomes theta2_before-90 instead of theta2_before.\n');
fprintf('Therefore, I changed it as if someone gives us the angles like in the first manipulator case.\n');
fprintf('If the configuration space is redefined to be theta2_before-90, this is unnecessary.\n');