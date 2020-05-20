function [] = disp_totalenergy(P_Sub, E_Sub, time, tmeasurement)
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
%% Bar graph of power per stage and power per subdevice
figure();
%linker as energy rechter as % van totaal (volledig of voor 1 meting?)




disp('finished disp_totalenergy');
end