fprintf('Denavit-Hartenberg Parameters');
DH_0_3 = table([0;0;0],[0;4;3],[0;0;0],['theta1*';'theta2*';'theta3*'],'VariableNames', ...
    {'alpha','a','d','theta'},'RowNames',{'L1','L2','L3'})

fprintf('Denavit-Hartenberg Parameters upto the End Effector');
DH_0_H = table([0;0;0;0],[0;4;3;2],[0;0;0;0],['theta1*';'theta2*';'theta3*';'      0'], ... 
    'VariableNames',{'alpha','a','d','theta'},'RowNames',{'L1','L2','L3','H'})