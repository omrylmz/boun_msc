clc, clear all;
fprintf('----------------------------------------------------------------------\n');
fprintf('a) i)\n');
fprintf('alpha = pi/18, beta = pi/9, gamma = pi/6');
R_i = ME_2A_a(pi/18, pi/9, pi/6)
fprintf('---6 Constraints For Orthonormality---\n');
fprintf('C1: |X|, magnitude of the first column, is: %f\n', sqrt(R_i(1,1)^2+R_i(2,1)^2+R_i(3,1)^2));
fprintf('C2: |Y|, magnitude of the second column, is: %f\n', sqrt(R_i(1,2)^2+R_i(2,2)^2+R_i(3,2)^2));
fprintf('C3: |Z|, magnitude of the third column, is: %f\n', sqrt(R_i(1,3)^2+R_i(2,3)^2+R_i(3,3)^2));
fprintf('C4: |X|.|Y| is: %f\n', dot(R_i(:,1),R_i(:,2)));
fprintf('C4: |X|.|Z| is: %f\n', dot(R_i(:,1),R_i(:,3)));
fprintf('C4: |Y|.|Z| is: %f\n\n', dot(R_i(:,2),R_i(:,3)));
fprintf('Inverse of the rotation matrix is:');
R_inv = inv(R_i),
fprintf('Transpose of the rotation matrix is:');
R_tran = R_i',
fprintf('Both are equivalent.\n\n');

fprintf('   ii)\n')
fprintf('alpha = pi/6, beta = pi/2, gamma = -55*pi/180');
R_ii = ME_2A_a(pi/6, pi/2, -55*pi/180)

fprintf('----------------------------------------------------------------------\n');
fprintf('b)\n');
fprintf('''ME_2A_b(ME_2A_a(pi/18, pi/9, pi/6))'' is {10, 20, 30} or {-170, 160, -150}');
[ang1, ang2] = ME_2A_b(ME_2A_a(pi/18, pi/9, pi/6));
[ang1; ang2]/pi*180
fprintf('However, there is a singularity in the second case with infinitely many solutions.\n');
fprintf('One solution assumes alpha is 0 and finds gamma accordingly (given beta is pi/2 or -pi/2).');
[ang1, ang2] = ME_2A_b(ME_2A_a(pi/6, pi/2, -55*pi/180));
[ang1; ang2]/pi*180
fprintf('These angles (in radians) give the same rotation matrix with {pi/6, pi/2, -55*pi/180}\n');
fprintf('when put in ME_2A_a function.\n\n');

fprintf('----------------------------------------------------------------------\n');
fprintf('c)');
R_a_b = ME_2A_a(0, pi/9, 0);
Pb = [1; 0; 1];
Pa = R_a_b*Pb
Fig_ME_2A_c = imread('Fig_ME_2A_c.jpg');
imshow(Fig_ME_2A_c);
title('Figure Matlab Exercise 2A c)');
fprintf('----------------------------------------------------------------------\n');