clc, clear all;
T = [0.25 0.43 0.86 5; 0.87 -0.5 0 -4; 0.43 0.75 -0.5 3; 0 0 0 1];
fprintf('The upper left 3x3 submatrix of T is the rotation matrix R.\n');
fprintf('The inverse of R is equal to its transpose.');
RT = T(1:3,1:3)'
fprintf('The first 3 elements of the 4th column of T is the position matrix P.\n');
P = T(1:3,4);
fprintf('The first 3 elements of the 4th column of Tinv is given by -RT*P.');
-RT*P
Tinv = [[RT -RT*P]; ...
        [0 0 0 1]];
fprintf('Tinv(4,2) is: %f\n', Tinv(2,4));