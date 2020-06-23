function [] = disp_sensors(Results, Sensorname,Save)
disp('started the disp_sensors function');
%input:
% Results is an matrix with the same elements as in calc_sensors: 
%   each row is another Sensor
%   each column is another Parameter (power in DS, Power when measuring,
%   total energy, energy only due to measurements.)

set(groot, 'defaultFigurePosition', get(0, 'Screensize'));
%set(groot, 'defaultFigurePosition', 'factory');
set(0,'DefaultFigureWindowStyle','docked')  % 'normal' to un-dock
saveasformat = 'epsc';

N_Max = size(Results,3);
NoS = size(Results,1);
check = size(Sensorname,2);
if check ~= NoS
    error('disp_sensors: number of sensors in Results ~= Sensorname ');
end
P_S_M_DS= permute(Results(:,3,:),[1 3 2]); %https://nl.mathworks.com/matlabcentral/answers/409179-how-can-i-extract-the-slices-of-a-3d-matrix-in-x-direction-from-a-3d-matrix
P_S_M = permute(Results(:,4,:),[1 3 2]);

%% subFigure 1: Energy used by the sensors per day (Exl. DS)
N = linspace(1, N_Max, N_Max);
figure();
subplot(1,2,1);
plot(N, P_S_M);
title('Energy used by the sensors per day (Exl. DS)')
xlabel('Number of measurements per day [N/Day]');
ylabel('Energy consumed per day [mJ/Day]');
legend(cellstr(Sensorname(1,:)),'Location','bestoutside');
%% subFigure 2: Energy used by the sensors per day (Incl. DS)
subplot(1,2,2);
plot(N, P_S_M_DS);
title('Energy used by the sensors per day (Incl. DS)')
xlabel('Number of measurements per day [N/Day]');
ylabel('Energy consumed per hour [mJ/Day]');
legend(cellstr(Sensorname(1,:)),'Location','bestoutside');
if Save
    saveas(gcf, 'Latexplots\SensorsEnergyDay', saveasformat);
end
%% Figure 3: Sensor power and energy consumption for one measurement
figure();
%https://nl.mathworks.com/help/matlab/ref/plotyy.html
%https://nl.mathworks.com/matlabcentral/answers/164738-bar-plot-with-two-y-axes
%Results() needs to be row vector. 
[AX,H1,H2]=plotyy(1:NoS,[Results(:,2,1) nan(NoS,1)],1:NoS,[nan(NoS,1) Results(:,4,1)],@bar,@bar);
linkaxes(AX,'x');
title('Sensor power and energy consumption for one measurement');
ylabel(AX(1),'Power consumption while measuring[mW]');
ylabel(AX(2),'Energy consumption for one measurment [mJ]');
legend([H1(1) H2(1)],'Deep Sleep','Measuring');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:NoS,'XTickLabelRotation',20,'xticklabel',cellstr(Sensorname(1,:))); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319') 
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 NoS+0.5]);
if Save
    saveas(gcf, 'Latexplots\SensorsPowerEnergyBar', saveasformat);
end
%% Figure 4: Power consumption of the sensors in Deep Sleep
figure();
% subplot(1,2,1) %----------------- niet gesorteerd 
bar(Results(:,1,1));
ylabel('Power [mW]');
title('Power consumption of the sensors in Deep Sleep');
set(gca, 'XTick', 1:1:NoS,'XTickLabelRotation',45,'xticklabel',cellstr(Sensorname(1,:))); 

% subplot(1,2,2) %------------------ gesorteerd https://stackoverflow.com/questions/22613615/sorting-barh-plots-in-matlab
% [sorted_data, new_indices] = sort(Results(:,1,1)); % sorts in *ascending* order
% sorted_labels = Sensorname(1,new_indices); 
% bar(sorted_data);
% ylabel('Power [mW]');
% title('Power consumption of the sensors in Deep Sleep');
% set(gca, 'XTick', 1:1:NoS,'XTickLabelRotation',45,'xticklabel',cellstr(sorted_labels(1,:))); 

if Save
    saveas(gcf, 'Latexplots\SensorsPowerDSBar', saveasformat);
end
disp('finished the disp_sensors function');
end