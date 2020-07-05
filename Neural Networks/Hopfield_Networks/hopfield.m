function H = hopfield(V1, V2, V3, V4, V5, V6, V7)
    
    %Find the elements of the Hopfield matrix
    switch nargin
        case 7
            H = V1*V1' + V2*V2' + V3*V3' + V4*V4' + V5*V5' + V6*V6' + V7*V7';
        case 6
            H = V1*V1' + V2*V2' + V3*V3' + V4*V4' + V5*V5' + V6*V6';
        case 5
            H = V1*V1' + V2*V2' + V3*V3' + V4*V4' + V5*V5';
        case 4
            H = V1*V1' + V2*V2' + V3*V3' + V4*V4';
        case 3
            H = V1*V1' + V2*V2' + V3*V3';
        case 2
            H = V1*V1' + V2*V2';
        otherwise
            H = V1*V1';     
    end
    
    %Discard the main diagonal elements
    for i = 1:size(V1)
        H(i,i) = 0;
    end
    
end