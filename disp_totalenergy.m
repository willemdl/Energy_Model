function [] = disp_totalenergy(P_Sub, P_Total, E_Total, T_Array, tmeasurement)
disp('started disp_totalenergy');

figure();
plot(T_Array(:), E_Total(:));
title('Energy usage');
xlabel('Time');
xlim([0 max(T_Array(:))]);
ylabel('E [mJ]');
legend('Energy');

figure();
plot(T_Array(:), P_Total(:));
title('Power drawn');
xlabel('Time');
xlim([0 max(T_Array(:))]);
ylabel('P [mW]');
legend('Power');

figure();
plot(T_Array(:), P_Sub(:,5));
title('Power drawn2');
xlabel('Time');
xlim([0 max(T_Array(:))]);
ylabel('P [mW]');
legend('Power');


figure();
semilogy(T_Array(1:end-1),diff(T_Array),'-x'); %https://nl.mathworks.com/help/physmod/simscape/ug/determine-step-size.html
title('Step size of totalenergy');
xlabel('Time');
xlim([0 max(T_Array(:))]);
ylabel('Step size [s]');



%---------- uitzoeken welke combinaties van intervallen mogelijk zijn,
%stel: intervallen 300 400 en 500 dan heb je deze 3 verschillende metingen
%maar ook de combinaties van deze intervallen. als we de tijden kunnen
%bepalen wanneer deze combinaties voor het eerst plaats vinden dan kunnen
%we al deze mogelijkheden bijelkaar/naastelkaar plotten. 
M_Plot = 1;
test = (tmeasurement(M_Plot,2)-tmeasurement(M_Plot,1))/2;
figure();
plot(T_Array(:), P_Total(:));
xlim([(tmeasurement(M_Plot,1)-test) (tmeasurement(M_Plot,2)+test)]);
title('Power drawn measuremnt1');
xlabel('Time');
ylabel('P [mW]');
legend('Power');
disp('finished disp_totalenergy');

figure();
plot(T_Array(:), P_Sub(:,6));
xlim([(tmeasurement(M_Plot,1)-test) (tmeasurement(M_Plot,2)+test)]);
title('Stages measuremnt1');
xlabel('Time');
ylabel('Stage');
legend('stages');
disp('finished disp_totalenergy');
end