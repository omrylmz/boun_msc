function T = ME_2B_a(alpha, beta, gamma, P)
    Rz = @(alpha) [cos(alpha) -sin(alpha) 0; sin(alpha) cos(alpha) 0; 0 0 1];
    Ry = @(beta) [cos(beta) 0 sin(beta); 0 1 0; -sin(beta) 0 cos(beta)];
    Rx = @(gamma) [1 0 0; 0 cos(gamma) -sin(gamma); 0 sin(gamma) cos(gamma)];
    R = Rz(alpha)*Ry(beta)*Rx(gamma);
    T = [[R P];[0 0 0 1]];
end