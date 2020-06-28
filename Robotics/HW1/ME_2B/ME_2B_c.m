function Tinv = ME_2B_c(a, b, g, P);
    syms A B G
    Rz(A) = [cos(A) -sin(A) 0; sin(A) cos(A) 0; 0 0 1];
    Ry(B) = [cos(B) 0 sin(B); 0 1 0; -sin(B) 0 cos(B)];
    Rx(G) = [1 0 0; 0 cos(G) -sin(G); 0 sin(G) cos(G)];
    R(A, B, G) = Rz(A)*Ry(B)*Rx(G);
    T = [[R(sym(a),sym(b),sym(g)) P];[0 0 0 1]];
    Tinv = double(inv(T));
end
