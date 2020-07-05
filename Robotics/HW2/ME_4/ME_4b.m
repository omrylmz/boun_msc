function [Angles1, Angles2] = ME_4b(TB_H)
syms theta1 theta2 theta3
L1 = 4; L2 = 3; L3 = 2;
T0_1(theta1) = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0;
                0 0 1 0; 0 0 0 1];
T1_2(theta2) = [cos(theta2) -sin(theta2) 0 L1; sin(theta2) cos(theta2) 0 0;
                0 0 1 0; 0 0 0 1];
T2_3(theta3) = [cos(theta3) -sin(theta3) 0 L2; sin(theta3) cos(theta3) 0 0;
                0 0 1 0; 0 0 0 1];
T3_H = [1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
TH_3 = [1 0 0 -L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];

TB_W = TB_H*TH_3;
x = TB_W(1, 4);
y = TB_W(2, 4);
phi = atan2(TB_H(2,1), TB_H(1,1));

c2 = (x^2 + y^2 - L1^2 - L2^2)/(2*L1*L2);
if(c2>1 || c2<-1)
    fprintf('Configuration is not in the workspace.\n');
    return;
end
if((abs(TB_H(1,1)-TB_H(2,2)) > 0.001) || (abs(TB_H(1,2)+TB_H(2,1)) > 0.001))
    fprintf('Configuration is not in the workspace.\n');
    return;
end    
s2_1 = sqrt(1 - c2^2);
s2_2 = -sqrt(1 - c2^2);
Theta2_1 = atan2(s2_1, c2);
Theta2_2 = atan2(s2_2, c2);
k1 = L1 + L2*c2;
k2_1 = L2*s2_1;
k2_2 = L2*s2_2;
Theta1_1 = atan2(y, x) - atan2(k2_1, k1);
Theta1_2 = atan2(y, x) - atan2(k2_2, k1);
Theta3_1 = phi - Theta1_1 - Theta2_1;
Theta3_2 = phi - Theta1_2 - Theta2_2;
Angles1 = [Theta1_1, Theta2_1, Theta3_1];
Angles2 = [Theta1_2, Theta2_2, Theta3_2];
end