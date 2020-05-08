function [] = resultsensorstemp(NoS, N_Max, E_consumed)
disp('resultssensorstemp.m');
%% Plot energy calculations

N = linspace(1, N_Max, N_Max);
skipNum = [4];
for i = 1:NoS
    if ~ismember(i,skipNum)
        plot(N,E_consumed(i,N));
        hold on
    end
end
title('Energy used by sensor per hour for N amount of measurements done per hour')
xlabel('Number of measurements per hour [N/h]');
ylabel('Energy consumed per hour [J/h]');
legend('TMP117', 'Si7051', 'AS6212', 'MAX30208', 'MAX44006');

hold off
end