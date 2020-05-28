function disp_totalcomparison()
% Selected_Results
% NoR = size(Selected_Results,1); % de size nog fixen  NoR is Number of Results 
% Results(NoR) = struct(); 
% for i=1:1:NoR % de size nog fixen
%     loadfile = Selected_Results(i); % afhankelijk van hoe Seleced_Results gaat zijn
%     Results(i) = load(loadfile); 
% end
% %tips: 
% % test = [results.time]; gives all time vectors in columns 
Results = load('appsave/4testresultaten.mat');
Results = [Results(:).Results];

NoR = 4;


%% Figure 1: Energy & Power
for i=1:1:NoR
    Max(i) = max(Results(i).time,[],1); % if one simulation is longer than another the axis will be set to the largest one. 
end
Time_Max = max(Max);
figure('Name','geweldige plotjes','NumberTitle','off');
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
legend('Energy');


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
legend('Power');


end