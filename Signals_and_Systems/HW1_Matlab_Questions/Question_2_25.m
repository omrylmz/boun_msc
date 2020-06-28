time = -2:0.1:2;

subplot 411;
x_a = @(t) arrayfun(@(t) (2*abs(t)^1.3 - 3*abs(t)) / (exp(-4*abs(t-1)) + 1), t);
plot(time, x_a(time));
xlabel('t');
ylabel('x(t)')

subplot 412;
x_b = @(t) x_a(0.7*t);
plot(time, x_b(time));
xlabel('t');
ylabel('x(0.7t)')

subplot 413;
x_c = @(t) x_a(-t);
plot(time, x_c(time));
xlabel('t');
ylabel('x(-t)')

subplot 414;
x_d = @(t) x_a(-2*t-1);
plot(time, x_d(time));
xlabel('t');
ylabel('x(-2t-1)');
