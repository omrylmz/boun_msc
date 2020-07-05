function experiment(V1, V2, V3, V4, V5, V6, V7)

    % Pixels to vectors from top-left to bottom-right
    dict = containers.Map;
    dict('0') = [-1 1 1 1 -1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, -1 1 1 1 -1]';;
    dict('1') = [-1 -1 1 -1 -1, 1 1 1 -1 -1, -1 -1 1 -1 -1, -1 -1 1 -1 -1, -1 -1 1 -1 -1, -1 -1 1 -1 -1, 1 1 1 1 1]';
    dict('2') = [-1 1 1 1 -1, 1 -1 -1 -1 1, -1 -1 -1 1 -1, -1 -1 1 -1 -1, -1 1 -1 -1 -1, 1 -1 -1 -1 -1, 1 1 1 1 1]';
    dict('3') = [-1 1 1 1 -1, 1 -1 -1 -1 1, -1 -1 -1 -1 1, -1 -1 1 1 -1, -1 -1 -1 -1 1, 1 -1 -1 -1 1, -1 1 1 1 -1]';
    dict('4') = [1 -1 -1 -1 -1, 1 -1 -1 -1 -1, 1 -1 -1 -1 -1, 1 -1 1 -1 -1, 1 1 1 1 1, -1 -1 1 -1 -1, -1 -1 1 -1 -1]';
    dict('5') = [1 1 1 1 1, 1 -1 -1 -1 -1, 1 -1 -1 -1 -1, 1 1 1 1 -1, -1 -1 -1 -1 1, -1 -1 -1 -1 1, 1 1 1 1 -1]';
    dict('6') = [-1 1 1 1 -1, 1 -1 -1 -1 1, 1 -1 -1 -1 -1, 1 1 1 1 -1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, -1 1 1 1 -1]';
    dict('7') = [1 1 1 1 1, -1 -1 -1 -1 1, -1 -1 -1 1 -1, -1 -1 1 -1 -1, -1 -1 1 -1 -1, -1 -1 1 -1 -1, -1 -1 1 -1 -1]';
    dict('8') = [-1 1 1 1 -1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, -1 1 1 1 -1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, -1 1 1 1 -1]';
    dict('9') = [-1 1 1 1 -1, 1 -1 -1 -1 1, 1 -1 -1 -1 1, -1 1 1 1 1, -1 -1 -1 -1 1, 1 -1 -1 -1 1, -1 1 1 1 -1]';
    dict('%') = [1 -1 -1 -1 1, -1 -1 -1 -1 1, -1 -1 -1 1 -1, -1 -1 1 -1 -1, -1 1 -1 -1 -1, 1 -1 -1 -1 -1, 1 -1 -1 -1 1]';
    dict('=') = [-1 -1 -1 -1 -1, -1 -1 -1 -1 -1, 1 1 1 1 1, -1 -1 -1 -1 -1, 1 1 1 1 1, -1 -1 -1 -1 -1, -1 -1 -1 -1 -1]';
    dict('+') = [-1 -1 -1 -1 -1, -1 -1 1 -1 -1, -1 -1 1 -1 -1, 1 1 1 1 1, -1 -1 1 -1 -1, -1 -1 1 -1 -1, -1 -1 -1 -1 -1]';
    dict('-') = [-1 -1 -1 -1 -1, -1 -1 -1 -1 -1, -1 -1 -1 -1 -1, 1 1 1 1 1, -1 -1 -1 -1 -1, -1 -1 -1 -1 -1, -1 -1 -1 -1 -1]';
    dict('x') = [-1 -1 -1 -1 -1, 1 -1 -1 -1 1, -1 1 -1 1 -1, -1 -1 1 -1 -1, -1 1 -1 1 -1, 1 -1 -1 -1 1, -1 -1 -1 -1 -1]';
    dict(':') = [-1 -1 -1 -1 -1, -1 -1 -1 -1 -1, -1 -1 1 -1 -1, -1 -1 -1 -1 -1, -1 -1 1 -1 -1, -1 -1 -1 -1 -1, -1 -1 -1 -1 -1]';
    
    switch nargin
        case 1
            fprintf("\nHopfield network trained with '%c' pattern:\n", V1);
            H = hopfield(dict(V1));
            for noisy_pixels = [3 7 10]
                count = 0;
                for exp = 1:100;
                    V1_n = noise_adder(dict(V1), noisy_pixels);
                    if isequal(predict(H, V1_n), dict(V1))
                        count = count + 1;
                    end
                end
                fprintf("For %d number of wrong pixels: %d/100 times, '%c' has been detected.\n", noisy_pixels, count, V1);
            end
            
        case 2
            fprintf("\nHopfield network trained with '%c' and '%c' patterns:\n", V1, V2);
            H = hopfield(dict(V1), dict(V2));
            for noisy_pixels = [3 7 10]
                count = 0;
                for exp = 1:100;
                    V1_n = noise_adder(dict(V1), noisy_pixels);
                    if isequal(predict(H, V1_n), dict(V1))
                        count = count + 1;
                    end
                end
                fprintf("For %d number of wrong pixels: %d/100 times, '%c' has been detected.\n", noisy_pixels, count, V1);
            end
            
        case 3
            fprintf("\nHopfield network trained with '%c', '%c' and '%c' patterns:\n", V1, V2, V3);
            H = hopfield(dict(V1), dict(V2), dict(V3));
            for noisy_pixels = [3 7 10]
                count = 0;
                for exp = 1:100;
                    V1_n = noise_adder(dict(V1), noisy_pixels);
                    if isequal(predict(H, V1_n), dict(V1))
                        count = count + 1;
                    end
                end
                fprintf("For %d number of wrong pixels: %d/100 times, '%c' has been detected.\n", noisy_pixels, count, V1);
            end
        case 4
            fprintf("\nHopfield network trained with '%c', '%c', '%c' and '%c' patterns:\n", V1, V2, V3, V4);
            H = hopfield(dict(V1), dict(V2), dict(V3), dict(V4));
            for noisy_pixels = [3 7 10]
                count = 0;
                for exp = 1:100;
                    V1_n = noise_adder(dict(V1), noisy_pixels);
                    if isequal(predict(H, V1_n), dict(V1))
                        count = count + 1;
                    end
                end
                fprintf("For %d number of wrong pixels: %d/100 times, '%c' has been detected.\n", noisy_pixels, count, V1);
            end
        
        case 5
            fprintf("\nHopfield network trained with '%c', '%c', '%c', '%c' and '%c' patterns:\n", V1, V2, V3, V4, V5);
            H = hopfield(dict(V1), dict(V2), dict(V3), dict(V4), dict(V5));
            for noisy_pixels = [3 7 10]
                count = 0;
                for exp = 1:100;
                    V1_n = noise_adder(dict(V1), noisy_pixels);
                    if isequal(predict(H, V1_n), dict(V1))
                        count = count + 1;
                    end
                end
                fprintf("For %d number of wrong pixels: %d/100 times, '%c' has been detected.\n", noisy_pixels, count, V1);
            end
            
        case 6
            fprintf("\nHopfield network trained with '%c', '%c', '%c', '%c', '%c' and '%c' patterns:\n", V1, V2, V3, V4, V5, V6);
            H = hopfield(dict(V1), dict(V2), dict(V3), dict(V4), dict(V5), dict(V6));
            for noisy_pixels = [3 7 10]
                count = 0;
                for exp = 1:100;
                    V1_n = noise_adder(dict(V1), noisy_pixels);
                    if isequal(predict(H, V1_n), dict(V1))
                        count = count + 1;
                    end
                end
                fprintf("For %d number of wrong pixels: %d/100 times, '%c' has been detected.\n", noisy_pixels, count, V1);
            end
        
         case 7
            fprintf("\nHopfield network trained with '%c', '%c', '%c', '%c', '%c', '%c' and '%c' patterns:\n", V1, V2, V3, V4, V5, V6, V7);
            H = hopfield(dict(V1), dict(V2), dict(V3), dict(V4), dict(V5), dict(V6), dict(V7));
            for noisy_pixels = [3 7 10]
                count = 0;
                for exp = 1:100;
                    V1_n = noise_adder(dict(V1), noisy_pixels);
                    if isequal(predict(H, V1_n), dict(V1))
                        count = count + 1;
                    end
                end
                fprintf("For %d number of wrong pixels: %d/100 times, '%c' has been detected.\n", noisy_pixels, count, V1);
            end
end