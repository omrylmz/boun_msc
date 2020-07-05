clear all, clc;
x = @(v) arrayfun(@(v) sqrt(v)*exp(-0.5*(v^1.5))*heaviside(v-2), v);
y = @(v) arrayfun(@(v) (1.5^v)*heaviside(-v+3), v);
z_1arg = @(t) integral(@(tau) x(tau).*y(t-tau), 2, t);
z = @(t) arrayfun(z_1arg, t);

figure(1);
time_a = -5:0.05:15;
zp = z(time_a);
plot(time_a, zp);
xlabel('t');
ylabel('Conv(x(t), y(t))');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ramp = @(t) t.*heaviside(t);
a = @(t) 2*heaviside(t+2.5) + ramp(t+1) -2*ramp(t-1) + ramp(t-3.25) ...
    -2.5*heaviside(t-4.5) + 2*ramp(t-5.75) -2*ramp(t-7) - 1.75*heaviside(t-8.25);
b = @(t) ramp(t-1) - ramp(t-2.5) - 1.5*heaviside(t-3) + 0.75*ramp(t-3.5) ... 
    - ramp(t-5.25) + 0.375*ramp(t-8);
c_1arg = @(t) integral(@(tau) a(tau).*b(t-tau), -inf, t);
c = @(t) arrayfun(c_1arg, t);

figure(2);
time_b = -10:0.1:25;
cp = c(time_b);
plot(time_b, cp);
xlabel('t');
ylabel('Conv(a(t), b(t))');