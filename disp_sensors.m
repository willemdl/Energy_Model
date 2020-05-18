function [] = disp_sensors(Results, Sensorname)
disp('started the disp_sensors function');

N_Max = max(size(Results(3,1,:)));
NoS = max(size(Sensorname));

N = linspace(1, N_Max, N_Max);
for i = 1:NoS
        tijdelijk = permute(Results(3,:,:), [3 2 1]);
        E_consumed = tijdelijk(:,:);
        plot(N,E_consumed(:,i));
        hold on
end
title('Energy used by sensor per hour for N amount of measurements done per hour')
xlabel('Number of measurements per hour [N/h]');
ylabel('Energy consumed per hour [J/h]');
legend(Sensorname);

disp('finished the disp_sensors function');
end