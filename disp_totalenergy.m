function [] = disp_totalenergy(P_Sub, E_sub, time, tmeasurement)
disp('started disp_totalenergy');

figure();
plot(time(:), E_sub(:,end-1));
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
M_Plot = 5;
test = (tmeasurement(M_Plot,2)-tmeasurement(M_Plot,1))/2;
figure();
plot(time(:), P_Sub(:,end-1));
xlim([(tmeasurement(M_Plot,1)-test) (tmeasurement(M_Plot,2)+test)]);
title('Power drawn measuremnt1');
xlabel('Time');
ylabel('P [mW]');
legend('Power');
disp('finished disp_totalenergy');

figure();
plot(time(:), P_Sub(:,end));
xlim([(tmeasurement(M_Plot,1)-test) (tmeasurement(M_Plot,2)+test)]);
title('Stages measuremnt1');
xlabel('Time');
ylabel('Stage');
legend('stages');
disp('finished disp_totalenergy');
end