clc, clear all;
syms q1 q2 q3
L1 = 4; L2 = 3; L3 = 2;
T0_1(q1) = [cos(q1) -sin(q1) 0; sin(q1) cos(q1) 0; 0 0 1];
T1_2(q2) = [cos(q2) -sin(q2) L1; sin(q2) cos(q2) 0; 0 0 1];
T2_3(q3) = [cos(q3) -sin(q3) L2; sin(q3) cos(q3) 0; 0 0 1];
T3_H = [1 0 L3; 0 1 0; 0 0 1];
T0_H(q1, q2, q3) = T0_1(q1)*T1_2(q2)*T2_3(q3)*T3_H;

J0(q1, q2, q3) = [-L1*sin(q1)-L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L3*sin(q1+q2+q3);
                  L1*cos(q1)+L2*cos(q1+q2)+L3*cos(q1+q2+q3), L2*cos(q1+q2)+L3*cos(q1+q2+q3), L3*cos(q1+q2+q3); 1 1 1];
J0inv(q1, q2, q3) = inv(J0(q1, q2, q3));
J0det(q1, q2, q3) = det(J0(q1, q2, q3));
              
dt = 0.1; t = 0:dt:5; len = length(t);
T = zeros(3, 3, len);
Xdot = [0.2; -0.3; -0.2];
X = zeros(3, len);
Qdot = zeros(3, len);
Q = zeros(3, len);
Q(:,1) = [10; 20; 30]/180*pi;
Jdet = zeros(1, len);

W = [1; 2; 3];
f = zeros(3, len);

for i=1:(len-1)
    Qdot(:,i) = J0inv(Q(1,i), Q(2,i), Q(3,i))*Xdot;
    T(:,:,i) = T0_H(Q(1,i), Q(2,i), Q(3,i));
    X(1:2,i) = [T(1,3,i); T(2,3,i)];
    X(3,i) = atan2(T(2,1,i), T(1,1,i));
    Jdet(1,i) = double(J0det(Q(1,i), Q(2,i), Q(3,i)));
    f(:,i) = J0(Q(1,i), Q(2,i), Q(3,i))'*W;
    Q(:,i+1) = Q(:,i) + Qdot(:,i)*dt;
end
Qdot(:,len) = J0inv(Q(1,len), Q(2,len), Q(3,len))*Xdot;
T(:,:,len) = T0_H(Q(1,len), Q(2,len), Q(3,len));
X(1:2,len) = [T(1,3,len); T(2,3,len)];
X(3,len) = atan2(T(2,1,len), T(1,1,len));
Jdet(1,len) = double(J0det(Q(1,len), Q(2,len), Q(3,len)));
f(:,len) = J0(Q(1,len), Q(2,len), Q(3,len))'*W;

figure(1);
plot(t, Qdot);
xlabel('time (t)');
ylabel('{\theta}dot (rad/s)')
title('Joint Rates');
legend {\theta}_{1} {\theta}_{2} {\theta}_{3};
grid on;

figure(2);
plot(t, Q/pi*180);
xlabel('time (t)');
ylabel('{\theta} (degree)')
title('Joint Angles');
legend {\theta}_{1}dot {\theta}_{2}dot {\theta}_{3}dot;
grid on;

figure(3);
plot(t, X);
xlabel('time (t)');
ylabel('{\theta} (m, rad)')
title('End Effector Position and Orientation');
legend x y {\phi};
grid on;

figure(4);
plot(t, Jdet);
xlabel('time (t)');
ylabel('det(J)')
title('Determinant of the Jacobian Matrix');
grid on;

figure(5);
plot(t, f);
xlabel('time (t)');
ylabel('Torque (N.m)')
title('Joint Torques');
legend {\tau}_{1} {\tau}_{2} {\tau}_{3};
grid on;
