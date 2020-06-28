syms alpha a d theta
Rz(theta) = [[[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1] ...
    [0; 0; 0]];[0 0 0 1]];
Rx(alpha) = [[[1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)] ...
    [0; 0; 0]];[0 0 0 1]];
Dx(a) = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Dz(d) = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
T(alpha, a, theta, d) = Rx(alpha)*Dx(a)*Rz(theta)*Dz(d);

syms theta1 theta2 theta3
T_0_1 = T(0, 0, theta1, 0)
T_1_2 = T(0, 4, theta2, 0)
T_2_3 = T(0, 3, theta3, 0)
T_3_H = T(0, 2, 0, 0)

%T_0_3 = @(theta1, theta2, theta3) T(0, 0, theta1, 0)*T(0, 4, theta2, 0)*T(0, 3, theta3, 0)
%T_0_H = @(theta1, theta2, theta3) T(0, 0, theta1, 0)*T(0, 4, theta2, 0)* ...
%    T(0, 3, theta3, 0)*T(0, 2, 0, 0)