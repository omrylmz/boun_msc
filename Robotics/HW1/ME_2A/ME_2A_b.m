function [angles1, angles2] = ME_2A_b(R)
    if (sqrt(R(1,1)^2+R(2,1)^2) > 0.00001)
        beta = [atan2(-R(3,1), sqrt(R(2,1)^2 + R(1,1)^2));
                atan2(-R(3,1), -sqrt(R(2,1)^2 + R(1,1)^2))];
        alpha = atan2(R(2,1)./cos(beta), R(1,1)./cos(beta));
        gamma = atan2(R(3,2)./cos(beta), R(3,3)./cos(beta));
    else
        alpha = [0; 0];
        beta = [pi/2; -pi/2];
        gamma = [atan2(R(1,2), R(2,2)); atan2(-R(1,2), R(2,2))];
    end
    angles1 = [alpha(1,1), beta(1,1), gamma(1,1)];
    angles2 = [alpha(2,1), beta(2,1), gamma(2,1)];
end