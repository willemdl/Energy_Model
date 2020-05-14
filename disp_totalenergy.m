function [] = disp_totalenergy(P_Total, E_Total, T_Array)
disp('started disp_totalenergy');

figure();
plot(T_Array(:), E_Total(:));
title('Energy usage');
xlabel('Time');
xlim([0 max(T_Array(:))]);
ylabel('E [mJ]');
legend('Energy');

figure();
plot(T_Array(:), P_Total(:));
title('Power drawn');
xlabel('Time');
xlim([0 max(T_Array(:))]);
ylabel('P [mW]');
legend('Power');
disp('finished disp_totalenergy');

figure();
plot(T_Array(1:end-1),diff(T_Array),'-x'); %https://nl.mathworks.com/help/physmod/simscape/ug/determine-step-size.html
title('Step size of totalenergy');
xlabel('Time');
xlim([0 max(T_Array(:))]);
ylabel('Step size [s]');
disp('finished disp_totalenergy');
end