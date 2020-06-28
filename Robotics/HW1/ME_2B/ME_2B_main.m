clc, clear all;
fprintf('----------------------------------------------------------------------\n');
fprintf('a) i)\n');
fprintf('alpha = pi/18, beta = pi/9, gamma = pi/6 and P = [1 2 3]''');
ME_2B_a(pi/18, pi/9, pi/6, [1 2 3]')

fprintf('   ii)\n')
fprintf('alpha = 0, beta = pi/9, gamma =0 and P = [3 0 1]''');
ME_2B_a(0, pi/9, 0, [3 0 1]')

fprintf('----------------------------------------------------------------------\n');
fprintf('b)');
Pa = ME_2B_a(0, pi/9, 0, [3 0 1]')*[1 0 1 1]';
Pa = Pa(1:3,:)
fprintf('1. It defines a new frame based on a chosen frame. Basically,\n');
fprintf('   new frame''s x2, y2, z2 coordinates are defined in the base frame.\n');
fprintf('2. It finds a point''s representation on the base frame using its known\n');
fprintf('   representation from another frame.\n');
fprintf('3. It moves a point to its new position represented in the same frame.\n\n');
figure(1);
Fig_ME_2B_b = imread('Fig_ME_2B_b.jpg');
imshow(Fig_ME_2B_b);
title('Figure Matlab Exercise 2B b)');

fprintf('----------------------------------------------------------------------\n');
fprintf('c) i)\n');
fprintf('Inverse matrix found by symbolic method is given below:');
Rinv_sym = ME_2B_c(pi/18, pi/9, pi/ 6, [1 2 3]')
fprintf('Numerical solution gives the same result:');
Rinv_num = inv(ME_2B_a(pi/18, pi/9, pi/ 6, [1 2 3]'))
fprintf('Rinv * R gives identity matrix.');
Rinv_sym * ME_2B_a(pi/18, pi/9, pi/ 6, [1 2 3]')

fprintf('   ii)\n');
fprintf('Same applies for ii)');
Rinv_sym = ME_2B_c(0, pi/9, 0, [3 0 1]')
Rinv_num = inv(ME_2B_a(0, pi/9, 0, [3 0 1]'))
Rinv_sym * ME_2B_a(0, pi/9, 0, [3 0 1]')

fprintf('----------------------------------------------------------------------\n');
fprintf('d) i)\n');
T_a_b = ME_2B_a(pi/18, pi/9, pi/6, [1 2 3]')
T_b_c = ME_2B_a(0, pi/9, 0, [3 0 1]')
T_a_c = T_a_b*T_b_c
T_c_b = inv(T_b_c)
T_b_a = inv(T_a_b)
T_c_a = T_c_b*T_b_a

fprintf('   ii)\n');
fprintf('Results are identical.');
T_a_b = T_a_c*inv(T_b_c)

fprintf('   iii)\n');
fprintf('Results are identical.');
T_b_c = inv(T_a_b)*T_b_c
figure(2);
Fig_ME_2B_d = imread('Fig_ME_2B_d.jpg');
imshow(Fig_ME_2B_d);
title('Figure Matlab Exercise 2B d)');
fprintf('----------------------------------------------------------------------\n');