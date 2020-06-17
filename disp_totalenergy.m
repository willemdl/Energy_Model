function disp_totalenergy(Results_totalenergy)
disp('started disp_totalenergy');
set(groot, 'defaultFigurePosition', get(0, 'Screensize'));
set(0,'DefaultFigureWindowStyle','docked')  % 'normal' to un-dock
folder = '/Users/Willemdl/Desktop/TU Delft/BAP/Images';
Save = true;
P_Sub = Results_totalenergy.P_Sub;
E_Sub = Results_totalenergy.E_Sub;
Time = Results_totalenergy.Time;
T_m = Results_totalenergy.T_m;
Names = Results_totalenergy.Name;
%------------ tabel maken met heleboel berekende waardes. (wat nu grafisch
%is in een (of meerdere) tabellen zetten.
%--------------- bar graph van componenten energy stacked maken, iedere
%stackje is dan een stage!


%% Extra values that needed to be calculated.
Time_Max = max(Time);
NoC = size(P_Sub,2)-2; %Number of Components
NoS = size(P_Sub,2)-4;%Number of Sensors, -4 due to mcu, transmission, stage number en total columns
%linker as energy rechter as % van totaal (volledig of voor 1 meting?)
%Step_Vec = [0 ; diff(time)]; %zero added in orderto align the diff vector
%with power vector
%matrix, iedere colom is een stage iedere rij is k
%waar 1 staat geeft de stage aan voor die k
%geeft vector x,1 van alle unique stages, floor zorgt er voor dat substages naar hoofdstage word omgezet.
Stages = unique(floor(P_Sub(2:end,end))); %gives vector containing the stage numbers, neglecting substages
Stagesnames = ["Deep Sleep" "Wake Up" "Measurement" "Processing" "Transmission" ];
NoStages = size(Stages,1);%number of stages
% K_Stages is an logical array; 
% each column is an stage, each row represents k. 
% if cell 1 then that 'calculation'(=k) belongs to that specific stage
K_Stages = floor(P_Sub(:,end))==Stages';
%Step_Stages gives stepsize at each moment splitted over the stages. 
% (1,x)=stages (x,1)=k thus same as K_Stages but cell contains the stepsize
Step_Stages = K_Stages.*[0;diff(Time)]; 

T_Stages_Tot = (sum(Step_Stages,1)).';%gives total time spend in each stage.
T_Stages_Perc = (T_Stages_Tot(:) / Time_Max)*100;
T_Sub_Tot = 0;%gives time spend on each "module", kan maar hiervoor moet veel aangepast worden

P_Sub_Max = max(P_Sub(:,1:end-1),[],1);
P_Sub_Max_Perc = zeros(1,size(P_Sub_Max,2));%bevat zeros dus niet actief

P_Stages_Tot =K_Stages.*P_Sub(:,end-1); %each column is an stage, row is k
P_Stages_Max = max(P_Stages_Tot,[],1).';
%P_Stages_Min = min(P_Stages_Tot(P_Stages_Tot~0),[],1).'; %------------ nog fixen!
P_Stages_Min = zeros(size(Stages,1),1);

% E_per_k gives the energy consumed in each timestep and is thus not
% cumalative. 
E_per_k = P_Sub(:,1:end-1).*[0 ; diff(Time)];
E_Sub_Tot = E_Sub(end,1:end-1);%vector of total energy per component [%]
E_Sub_Perc = (E_Sub_Tot(:) / E_Sub_Tot(end))*100; %vector of total energy per component [%]
%in E_Stages_Tot The total energy per step is taken and splitted over
%columns which represent the different stages. Then the sum is taken of
%these columns.
E_Stages_Tot = (sum(K_Stages.*E_per_k(:,end),1)).';
E_Stages_Perc = (E_Stages_Tot(:) / E_Sub_Tot(end))*100;

%doel is om een vector te krijgen van sensor 1 waarin energy van die sensor
%is opgesplitst per stage vec = [E_S1_DS E_S1_WU E_S1_M ....] dit is niet
%mogelijk met E_Sub omdat deze al cumulatief is.
%the logical vector contaning the positions at which the patch is in DS is
%taken using K_Stages(:,1) 
losses = 0.1;
E_Stage_Component = zeros(NoC+1,NoStages);
E_per_k_losses = E_per_k(:,:)*losses;
%E_Stage_Comp is a matrix, each row is an component and the last row is the
%Total of the sensor patch. each column is an stage. thus each cell
%represents the energy that is consumed by an component in a specific stage
for i=1:1:NoStages
    E_Stage_Component(:,i) = sum(E_per_k(K_Stages(:,i),:)).';
end
E_Stage_Component(NoC+2,:) = E_Stage_Component(end,:)*losses;
%E_Stage_Component_losses = E_Stage_Component.*losses;






%% Plot of Total energy, Power and step size vs the time
figure('Name','geweldige plotjes','NumberTitle','off');
hour = 3600;
%subplot(3,1,1);
plot(Time(:)/hour, E_Sub(:,end-1)/1000);
title('Total Energy usage during full simulation');
xlabel('Time [h]');
xlim([0 Time_Max/hour]);
ylabel('E [J]');
legend('Energy');
grid on;
if Save
    saveas(gcf, 'Latexplots\totalenergyusage', 'svg');
end
figure();
%subplot(3,1,2);
plot(Time(:)/hour, P_Sub(:,end-1));
title('Total Power curve during full simulation');
xlabel('Time [h]');
xlim([0 Time_Max/hour]);
ylabel('Power [mW]');
legend('Power');
grid on;
if Save
    saveas(gcf, 'Latexplots\totalpowercurve', 'svg');
end

figure();
%subplot(3,1,3);
%https://nl.mathworks.com/help/physmod/simscape/ug/determine-step-size.html
semilogy(Time(1:end-1)/hour,diff(Time),'-x');
title('Step size of model in full simulation');
xlabel('Time [h]');
xlim([0 Time_Max/hour]);
ylabel('Step size [s]');
grid on;

if Save
    saveas(gcf, 'Latexplots\totalstepsize', 'svg');
end
%% plot of specific measurement with pattern of stages, power and energy
%---------- uitzoeken welke combinaties van intervallen mogelijk zijn,
%stel: intervallen 300 400 en 500 dan heb je deze 3 verschillende metingen
%maar ook de combinaties van deze intervallen. als we de tijden kunnen
%bepalen wanneer deze combinaties voor het eerst plaats vinden dan kunnen
%we al deze mogelijkheden bijelkaar/naastelkaar plotten.
M_Plot = 5;
test = (T_m(M_Plot,2)-T_m(M_Plot,1))/2;

figure();
sgtitle(['Plot of measurement: ', num2str(M_Plot)])
subplot(3,1,1)
plot(Time(:)/60, P_Sub(:,end));
xlim([(T_m(M_Plot,1)-test)/60 (T_m(M_Plot,2)+test)/60]);
title(['Pattern of system Stages during measuremnt: ',num2str(M_Plot)]);
xlabel('Time [min]');
ylabel('Stage');
legend('Stages');
grid on;

subplot(3,1,2)
plot(Time(:)/60, P_Sub(:,end-1));
xlim([(T_m(M_Plot,1)-test)/60 (T_m(M_Plot,2)+test)/60]);
title(['Pattern of Power drawn during measuremnt: ', num2str(M_Plot)]);
xlabel('Time[min]');
ylabel('P [mW]');
legend('Power');
grid on;

subplot(3,1,3)
plot(Time(:)/60, E_Sub(:,end-1)/1000);
xlim([(T_m(M_Plot,1)-test)/60 (T_m(M_Plot,2)+test)/60]);
title(['Pattern of Energy usage during measuremnt:', num2str(M_Plot)]);
xlabel('Time[min]');
ylabel('E [J]');
legend('Power');
grid on;
if Save
    saveas(gcf, 'Latexplots\total1measurement', 'svg');
end
%% Bar graph of energy and time in [%] per stage
figure();
%subplot(2,1,1);
y1 = T_Stages_Perc;
y2 = E_Stages_Perc;
x = NoStages;
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Time and energy consumption per stage in percentages');
ylabel(AX(1),'Time [%]');
ylabel(AX(2),'Energy usage [%]');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:x,'XTickLabelRotation',0,'xticklabel',cellstr(Stagesnames(1,:)));
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319')
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 x+0.5]);
xtips1 = H1(1).XEndPoints; %makes the text above the bars
ytips1 = H1(1).YEndPoints;
labels1 = string(round(H1(1).YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(1));
xtips2 = H2(2).XEndPoints;
ytips2 = H2(2).YEndPoints;
labels2 = string(round(H2(2).YData,2));
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(2));
if Save
    saveas(gcf, 'Latexplots\TimeEnergyBarStagePercentage', 'svg');
end
%% Bar graph Time and Energy in s and mJ per stage
figure();
%subplot(2,1,2);
y1 = T_Stages_Tot;
y2 = E_Stages_Tot;
x = NoStages;
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Time and energy per stage');
ylabel(AX(1),'Time [s]');
ylabel(AX(2),'Energy usage [mJ]');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:x,'XTickLabelRotation',0,'xticklabel',cellstr(Stagesnames(1,:)));
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319')
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 x+0.5]);
xtips1 = H1(1).XEndPoints; %makes the text above the bars
ytips1 = H1(1).YEndPoints;
labels1 = string(round(H1(1).YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(1));
xtips2 = H2(2).XEndPoints;
ytips2 = H2(2).YEndPoints;
labels2 = string(round(H2(2).YData,2));
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(2));
if Save
    saveas(gcf, 'Latexplots\totalTimeEnergyBarStage', 'svg');
end
%% Bar graph Time and Power in s and mW per stage
figure();
y1 = T_Stages_Tot;
y2 = [P_Stages_Max P_Stages_Min];
x = NoStages;
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Time and power per stage');
ylabel(AX(1),'Time [s]');
ylabel(AX(2),'Power [mW]');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:x,'XTickLabelRotation',45,'xticklabel',cellstr(Stagesnames(1,:)));
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319')
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 x+0.5]);
xtips1 = H1(1).XEndPoints; %makes the text above the bars
ytips1 = H1(1).YEndPoints;
labels1 = string(round(H1(1).YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(1));
xtips2 = H2(2).XEndPoints;
ytips2 = H2(2).YEndPoints;
labels2 = string(round(H2(2).YData,4));
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(2));
xtips3 = H2(2).XEndPoints;
ytips3 = H2(2).YEndPoints;
labels3 = string(round(H2(3).YData,4));
text(xtips3,ytips3,labels3,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(2));
if Save
    saveas(gcf, 'Latexplots\totalTimePowerBarStage', 'svg');
end
%% Bar graph energy and maximum power per component in mJ and mW
figure();
y1 = E_Sub_Tot.';
y2 = P_Sub_Max.';
x = NoC+1;% extra bar with Total values
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Energy usage and maximum power per Component');
ylabel(AX(1),'Energy usage [mJ]');
ylabel(AX(2),'maximum power [mW]');
%legend([H1(1) H2(1)],'Deep Sleep','Measuring');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:x,'XTickLabelRotation',45,'xticklabel',cellstr(Names(1,:)));
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319')
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 x+0.5]);
xtips1 = H1(1).XEndPoints; %makes the text above the bars
ytips1 = H1(1).YEndPoints;
labels1 = string(round(H1(1).YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(1));
xtips2 = H2(2).XEndPoints;
ytips2 = H2(2).YEndPoints;
labels2 = string(round(H2(2).YData,2));
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(2));
if Save
    saveas(gcf, 'Latexplots\totalEnergyPowerBarComponent', 'svg');
end
%% Bar graph energy and maximum power per component in [%]
figure();
NoC = size(P_Sub,2)-2; %Number of Components
y1 = E_Sub_Perc;
y2 = P_Sub_Max_Perc.';
x = NoC+1;%+1 because of plotting Total values too.
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Energy usage and maximum power per Component in percentages');
ylabel(AX(1),'Energy usage [%]');
ylabel(AX(2),'maximum power [%]');
%legend([H1(1) H2(1)],'Deep Sleep','Measuring');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:x,'XTickLabelRotation',45,'xticklabel',cellstr(Names(1,:)));
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319')
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 x+0.5]);
xtips1 = H1(1).XEndPoints; %makes the text above the bars
ytips1 = H1(1).YEndPoints;
labels1 = string(round(H1(1).YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(1));
xtips2 = H2(2).XEndPoints;
ytips2 = H2(2).YEndPoints;
labels2 = string(round(H2(2).YData,2));
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','parent',AX(2));
if Save
    saveas(gcf, 'Latexplots\totalEnergyPowerBarComponentPercentage', 'svg');
end
%% 
Names1 = [Names "losses"];
ybar = [E_Stage_Component ];%sum(E_Stage_Component_losses,2)];
figure();
X = categorical(Names1);
X = reordercats(X,Names1);
b = bar(X,ybar/1000,'stacked');
legend([Stagesnames]);
title('Bargraph of energy consumed per component');
xlabel('Components');
ylabel('Energy [J]')
if Save
    saveas(gcf, 'Latexplots\totalEnergyBarComponentstacked', 'svg');
end

%% 
Names1 = [Names(1:end-1) "losses"];
%row = x axis 
%column = y
ybar(6,:) = [];
ybar2 = permute(ybar, [2 1]);
figure();
X = categorical([Stagesnames]);
X = reordercats(X,[Stagesnames]);
b = bar(X,ybar2/1000,'stacked');
legend([Names1]);
title('Bargraph of energy consumed per stage');
xlabel('Stages');
ylabel('Energy [J]')
if Save
    saveas(gcf, 'Latexplots\totalEnergyBarStagestacked', 'svg');
end
%% 
figure();
X = categorical([Names]);
X = reordercats(X,[Names]);
ybar = P_Sub_Max.';
b = bar(X,ybar);
title('Bargraph of maximum power per component');
xlabel('Components');
ylabel('Power [mW]')
if Save
    saveas(gcf, 'Latexplots\totalPowerComponents', 'svg');
end

%% Table of important values EXAMPLE
%https://nl.mathworks.com/help/matlab/ref/uitable.html
%https://nl.mathworks.com/help/matlab/ref/matlab.ui.control.table-properties.html
% figure();
% colums_str = {'final time', 'Energyused'};
% Table_Values = [10000 5000; 10 50];
% uitable('ColumnName', colums_str, 'Data', Table_Values);
%% Table of Energy usage and power per stage
% figure();
%
% colums_str = {'Minimum Power', 'Maximum Power', 'Energy used', 'Time in this stage'};
% Table_Values = [P_Stages_Min P_Stages_Max E_Stages_Tot T_Stages_Tot];% need to be columns
% uitable('ColumnName', colums_str, 'Data', Table_Values);
stagestable = table(Stagesnames.', T_Stages_Tot, T_Stages_Perc, P_Stages_Max, P_Stages_Min, E_Stages_Tot, E_Stages_Perc);

set(groot, 'defaultFigurePosition', 'factory');
disp('finished disp_totalenergy');
end