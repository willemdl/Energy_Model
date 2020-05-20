function [] = disp_totalenergy(P_Sub, E_Sub, time, tmeasurement, names)
disp('started disp_totalenergy');

figure();
plot(time(:), E_Sub(:,end-1));
title('Total Energy usage');
xlabel('Time');
xlim([0 max(time(:))]);
ylabel('E [mJ]');
legend('Energy');

figure();
plot(time(:), P_Sub(:,end-1));
title('Total Power curve during full simulation');
xlabel('Time []');
xlim([0 max(time(:))]);
ylabel('Power [mW]');
legend('Power');



figure();
semilogy(time(1:end-1),diff(time),'-x'); %https://nl.mathworks.com/help/physmod/simscape/ug/determine-step-size.html
title('Step size of totalenergy');
xlabel('Time');
xlim([0 max(time(:))]);
ylabel('Step size [s]');



%---------- uitzoeken welke combinaties van intervallen mogelijk zijn,
%stel: intervallen 300 400 en 500 dan heb je deze 3 verschillende metingen
%maar ook de combinaties van deze intervallen. als we de tijden kunnen
%bepalen wanneer deze combinaties voor het eerst plaats vinden dan kunnen
%we al deze mogelijkheden bijelkaar/naastelkaar plotten. 
%% plot of one measurement with pattern of stages, power and energy 
M_Plot = 5;
test = (tmeasurement(M_Plot,2)-tmeasurement(M_Plot,1))/2;
figure();
subplot(3,1,1)
plot(time(:), P_Sub(:,end));
xlim([(tmeasurement(M_Plot,1)-test) (tmeasurement(M_Plot,2)+test)]);
title(['Pattern of system Stages during measuremnt:',num2str(M_Plot)]);
xlabel('Time');
ylabel('Stage');
legend('Stages');

subplot(3,1,2)
plot(time(:), P_Sub(:,end-1));
xlim([(tmeasurement(M_Plot,1)-test) (tmeasurement(M_Plot,2)+test)]);
title(['Pattern of Power drawn during measuremnt:', num2str(M_Plot)]);
xlabel('Time');
ylabel('P [mW]');
legend('Power');

subplot(3,1,3)
plot(time(:), E_Sub(:,end-1));
xlim([(tmeasurement(M_Plot,1)-test) (tmeasurement(M_Plot,2)+test)]);
title(['Pattern of Energy usage during measuremnt:', num2str(M_Plot)]);
xlabel('Time');
ylabel('E [mJ]');
legend('Power');
%% Bar graph of energy and time per stage in percentages

%linker as energy rechter as % van totaal (volledig of voor 1 meting?)
%Step_Vec = [0 ; diff(time)]; %zero added in orderto align the diff vector
%with power vector
%matrix, iedere colom is een stage iedere rij is k
%waar 1 staat geeft de stage aan voor die k
%geeft vector x,1 van alle unique stages, floor zorgt er voor dat substages naar hoofdstage word omgezet.
Stages = unique(floor(P_Sub(2:end,end))); 
K_Stages = floor(P_Sub(:,end))==Stages';%floor rond af naar beneden, dus nu worden sub stages genegeerd.
E_per_k = P_Sub(:,1:end-1).*[0 ; diff(time)];%matrix die de energie geeft per 
E_Sub_Tot = E_Sub(end,1:end-1);%vector of total energy per sensor/mcu/transmission
E_Sub_Perc = (E_Sub_Tot(:) / E_Sub_Tot(end))*100;
E_Stages_Tot = sum(K_Stages.*E_per_k(:,end),1);%each colum is an stage
E_Stages_Perc = (E_Stages_Tot(:)' / E_Sub_Tot(end))*100;
Step_Stages = K_Stages.*[0;diff(time)]; %gives stepsize at each moment splitted over the stages. (1,x)=stages (x,1)=k
T_Stages_Tot = sum(Step_Stages,1);%gives total time spend in each stage. 
T_Stages_Perc = (T_Stages_Tot(:)' / max(time))*100;
T_Sub_Tot = 0;%gives time spend on each "module", kan maar hiervoor moet veel aangepast worden
%NoM = size(P_Sub,2)-2;%Number of Modules (is sum of #of sensors, MCU and transmission.
NoStages = size(Stages,1);%number of stages
Stagesnames = strings(1,NoStages);
for i =1:1:NoStages
    Stagesnames(1,i) = "Stage "+ num2str(i);
end
figure();
[AX,H1,H2]=plotyy(1:NoStages,[T_Stages_Perc.' nan(NoStages,1)],1:NoStages,[nan(NoStages,1) E_Stages_Perc.'],@bar,@bar);
linkaxes(AX,'x');
title('Time and Energy per Stage in percentages');
ylabel(AX(1),'Time [%]');
ylabel(AX(2),'Energy usage [%]');
%legend([H1(1) H2(1)],'Deep Sleep','Measuring');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:NoStages,'XTickLabelRotation',45,'xticklabel',cellstr(Stagesnames(1,:))); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319') 
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 NoStages+0.5]);
%% Bar graph Time and Energy in s and mJ
figure();
[AX,H1,H2]=plotyy(1:NoStages,[T_Stages_Tot.' nan(NoStages,1)],1:NoStages,[nan(NoStages,1) E_Stages_Tot.'],@bar,@bar);
linkaxes(AX,'x');
title('Time and Energy per Stage');
ylabel(AX(1),'Time [s]');
ylabel(AX(2),'Energy usage [mJ]');
%legend([H1(1) H2(1)],'Deep Sleep','Measuring');
%https://nl.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html
set(AX, 'XTick', 1:1:NoStages,'XTickLabelRotation',45,'xticklabel',cellstr(Stagesnames(1,:))); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319') 
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 NoStages+0.5]);

disp('finished disp_totalenergy');
end