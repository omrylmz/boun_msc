function V = predict(H, V)
    
    %Apply the Hopfield network recursively
    for i = 1:1000
        V_old = V;
        V = sign(H*V);
        if V == V_old
            break;
        end
    end
    
end