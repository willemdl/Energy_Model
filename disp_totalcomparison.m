function disp_totalcomparison()
% Selected_Results
% NoR = size(Selected_Results,1); % de size nog fixen  NoR is Number of Results 
% Results(NoR) = struct(); 
% for i=1:1:NoR % de size nog fixen
%     loadfile = Selected_Results(i); % afhankelijk van hoe Seleced_Results gaat zijn
%     Results(i) = load(loadfile); 
% end
% %tips: 
% % test = [results.time]; gives all time vectors in columns ]
set(groot, 'defaultFigurePosition', get(0, 'Screensize'));
set(0,'DefaultFigureWindowStyle','docked')  % 'normal' to un-dock

Results = load('appsave/4testresultaten.mat');
Results = [Results(:).Results];
filenames = [{'calc1', 'calc2', 'calc3','calc4'}];
NoR = 4;


%% Figure 1: Energy & Power
for i=1:1:NoR
    Max(i) = max(Results(i).time,[],1); % if one simulation is longer than another the axis will be set to the largest one. 
end
Time_Max = max(Max);
figure('Name','comparison1','NumberTitle','off');
subplot(2,1,1);
for i=1:NoR
plot(Results(i).time(:)/3600, Results(i).E_Sub(:,end-1)/1000);
hold on
end
hold off 
title('Total Energy usage');
xlabel('Time [h]');
xlim([0 Time_Max/3600]);
ylabel('E [J]');
legend(filenames);


subplot(2,1,2);
for i =1:NoR
plot(Results(i).time(:)/3600, Results(i).P_Sub(:,end-1));
hold on
end
hold off 
title('Total Power curve during full simulation');
xlabel('Time [h]');
xlim([0 Time_Max/3600]);
ylabel('Power [mW]');
legend(filenames);

%% Figure 2 power van 2e measurement. 
M_Plot = 2;
figure('Name','1 measurement comparison','NumberTitle','off');
for i=1:NoR
    subplot(NoR, 1,i)
    test = (Results(i).T_m(M_Plot,2)-Results(i).T_m(M_Plot,1))/2;
    plot(Results(i).time(:), Results(i).P_Sub(:,end-1));
    xlim([(Results(i).T_m(M_Plot,1)-test) (Results(i).T_m(M_Plot,2)+test)]);
    title(['Pattern of Power drawn during measuremnt:', num2str(M_Plot),'of simulation:',filenames(1)]);
    xlabel('Time');
    ylabel('P [mW]');
    legend(filenames(i));   
end

    
end