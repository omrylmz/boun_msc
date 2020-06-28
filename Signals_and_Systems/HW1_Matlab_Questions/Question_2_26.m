x = @(nT, T) 4*(nT/T).^3 ./ (1 + 0.5./(nT/T) + 0.5*(nT/T).^4); 

subplot 411;
nT_a = -2:0.5:2;
stem(nT_a, x(nT_a, 0.5));

subplot 412;
nT_b = -2:0.25:2;
stem(nT_b, x(nT_b, 0.25));

subplot 413;
nT_c = -2:1:2;
stem(nT_c, x(-nT_c, 1));

subplot 414;
nT_d = -2:1/3:2;
stem(nT_d, x(-nT_d+3*(1/3), 1/3));