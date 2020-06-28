clc, clear all

fprintf("Part a)\n\n");
fprintf("0 means of C1, 1 means of C2\n")
sigmoid = @(z) 1 / (1 + exp(-z));
x1 = [0; 0; 1];
x2 = [0; 1; 1];
x3 = [1; 0; 1];
x4 = [1; 1; 1];

Ep = 2001;
LR = 0.5;
w(:,1) = [0; 0; 0];
for i = 1:4:Ep
    w(:,i+1) = w(:,i) + LR*(0-sigmoid(w(:,i)'*x1))*x1;
    w(:,i+2) = w(:,i+1) + LR*(0-sigmoid(w(:,i)'*x2))*x2;
    w(:,i+3) = w(:,i+2) + LR*(1-sigmoid(w(:,i)'*x3))*x3;
    w(:,i+4) = w(:,i+3) + LR*(1-sigmoid(w(:,i)'*x4))*x4;
end

fprintf("w1: %f\nw2: %f\nw3: %f\n", w(1,Ep),w(2,Ep),w(3,Ep))
fprintf("f(x1): %f\n",sigmoid(w(:,Ep)'*x1))
fprintf("f(x2): %f\n",sigmoid(w(:,Ep)'*x2))
fprintf("f(x3): %f\n",sigmoid(w(:,Ep)'*x3))
fprintf("f(x4): %f\n",sigmoid(w(:,Ep)'*x4))

fprintf("\n\nPart b)\n\n");

%Ep = 2001; LR = 0.5; w(:,1) = [0; 0; 0];
for i = 1:4:Ep
    w(:,i+1) = w(:,i) + LR*(0-sigmoid(w(:,i)'*x1))*x1;
    w(:,i+2) = w(:,i+1) + LR*(1-sigmoid(w(:,i)'*x2))*x2;
    w(:,i+3) = w(:,i+2) + LR*(1-sigmoid(w(:,i)'*x3))*x3;
    w(:,i+4) = w(:,i+3) + LR*(0-sigmoid(w(:,i)'*x4))*x4;
end

fprintf("w1: %f\nw2: %f\nw3: %f\n", w(1,Ep),w(2,Ep),w(3,Ep))
fprintf("f(x1): %f\n",sigmoid(w(:,Ep)'*x1))
fprintf("f(x2): %f\n",sigmoid(w(:,Ep)'*x2))
fprintf("f(x3): %f\n",sigmoid(w(:,Ep)'*x3))
fprintf("f(x4): %f\n",sigmoid(w(:,Ep)'*x4))

fprintf("A linear decision boundary cannot be defined. ");
fprintf("Network don't learn.\n");