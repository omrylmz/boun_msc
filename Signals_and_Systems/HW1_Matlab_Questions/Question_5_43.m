syms t w;
x = 4*(heaviside(t+2)-heaviside(t-2));
X = fourier(x);
w0 = 2*pi/8;
X0 = 4*4;   
X5 = [double(subs(X, w0*(-5:-1))), X0, double(subs(X, w0*(1:5)))];
X10 = [double(subs(X, w0*(-10:-1))), X0, double(subs(X, w0*(1:10)))];
X20 = [double(subs(X, w0*(-20:-1))), X0, double(subs(X, w0*(1:20)))];

x20=0;
for k=-20:20
    x20 = x20 + X20(1, k+21)*exp(j*k*w0*t);
end

x10=0;
for k=-10:10
    x10 = x10 + X10(1, k+11)*exp(j*k*w0*t);
end

x5=0;
for k=-5:5
    x5 = x5 + X5(1, k+6)*exp(j*k*w0*t);
end

subplot 311;
fplot(x5, [-10 10]);
xlabel('t');
ylabel('x_{5}(t)')
subplot 312;
fplot(x10, [-10 10]);
xlabel('t');
ylabel('x_{10}(t)')
subplot 313;
fplot(x20, [-10 10]);
xlabel('t');
ylabel('x_{20}(t)')