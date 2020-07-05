syms alpha a d theta t

s(t) = sin(t);
c(t) = cos(theta);

Rz(theta) = [[[c(theta) -c(theta) 0; s(theta) c(theta) 0; 0 0 1] ...
    [0; 0; 0]];[0 0 0 1]]; 
Rx(alpha) = [[[1 0 0; 0 c(alpha) -s(alpha); 0 s(alpha) c(alpha)] ...
    [0; 0; 0]];[0 0 0 1]];
Dx(a) = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Dz(d) = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
T(alpha, a, theta, d) = Rx(alpha)*Dx(a)*Rz(theta)*Dz(d);

syms t1 t2 t3
T_0_1 = T(0, 0, t1, 0);
T_1_2 = T(0, 4, t2, 0);
T_2_3 = T(0, 3, t3, 0);
T_3_H = T(0, 2, 0, 0);

T_0_3 = T(0, 0, t1, 0) * T(0, 4, t2, 0) * T(0, 3, t3, 0)
T_0_H = T(0, 0, t1, 0) * T(0, 4, t2, 0) * T(0, 3, t3, 0) * T(0, 2, 0, 0)

double(T(0, 0, pi/18, 0) * T(0, 4, pi/9, 0) * T(0, 3, pi/6, 0))