T_a2b = ME_2B_a(pi/18, pi/9, pi/6, [1; 2; 3])
T_b2c = ME_2B_a(0, pi/9, 0, [3; 0; 1])

fprintf('---i---');
T_a2c = T_a2b*T_b2c
T_c2a = inv(T_a2c)

fprintf('---ii---');
T_a2b = T_a2c*inv(T_b2c)
fprintf('Results are the same.\n\n');

fprintf('---iii---');
T_b2c = inv(T_a2b)*T_a2c
fprintf('Results are the same.\n\n');