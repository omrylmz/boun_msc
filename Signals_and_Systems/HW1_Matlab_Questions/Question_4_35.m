x = @(t) arrayfun(@(t) (cos(100*pi*t) + sin(400*pi*t) - sin(800*pi*t)) * heaviside(t), t);
h = @(t) arrayfun(@(t) 400*exp(-200*t)*cos(400*pi*t)*heaviside(t), t);
y_1arg = @(t) integral(@(tau) x(tau).*h(t-tau), -inf, t);
y = @(t) arrayfun(y_1arg, t);

time = -0.02:0.0001:0.1;
x_axis = [-0.02, 0.1];
subplot 511;
yp = y(time);
plot(time, yp);
xlim(x_axis);
ylim([-2 2]);
xlabel('t');
ylabel('y(t)');

subplot 512;
xp = x(time);
plot(time, xp);
xlim(x_axis);
ylim([-3 3]);
xlabel('t');
ylabel('x(t)');

x_cos_100 = @(t) arrayfun(@(t) cos(100*pi*t), t);
xp_cos_100 = x_cos_100(time);
subplot 513;
plot(time, xp_cos_100);
xlim(x_axis);
xlabel('t');
ylabel('cos(100\pit)');

x_cos_800 = @(t) arrayfun(@(t) cos(800*pi*t), t);
xp_cos_800 = x_cos_800(time);
subplot 514;
plot(time, xp_cos_800);
xlim(x_axis);
xlabel('t');
ylabel('cos(800\pit)');

x_sin_400 = @(t) arrayfun(@(t) sin(400*pi*t), t);
xp_sin_400 = x_sin_400(time);
subplot 515;
plot(time, xp_sin_400);
xlim(x_axis);
xlabel('t');
ylabel('sin(400\pit)');

fprintf('The signal w(t) is taken with some additive interference, which can be observed from the x(t) signal.\n');
fprintf('In order to decrease the interference we used a BPF whose passing band coincides with the original signal.\n');
fprintf('We observe that we practically restored the w(t) signal.');
