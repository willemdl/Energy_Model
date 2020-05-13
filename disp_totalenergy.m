function [] = disp_totalenergy(P_Total, E_Total, T_array)
disp('started disp_totalenergy');

plot(E_Total);
title('Energy usage');
xlabel('Time');
ylabel('E [mJ]');
legend('Energy');

figure();
plot(P_Total);
title('Power drawn');
xlabel('Time');
ylabel('P [mW]');
legend('Power');
disp('finished disp_totalenergy');
end