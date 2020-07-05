function V_n = noise_adder(V, N)
    V_n = V;
    noise_index = randperm(length(V), N);
    for i = 1:N
       V_n(noise_index(i)) = - V(noise_index(i));
    end
end