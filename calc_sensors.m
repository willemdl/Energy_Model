function [Results_calc_sensors, P_s_Measure, P_s_SHDN, E_s_consumed] = calc_sensors(Sensor)
disp('started the function calc_sensors');
%% Power calculations
%Calculating the amount of power consumed per sensor when measuring and
%when in 'shut down' mode.
VDD_TYP = Sensor(3,:);
IDD_TYP_Measure = Sensor(4,:);
IDD_TYP_SHDN = Sensor(7,:);
T_conv_TYP = Sensor(5,:);
NoS = size(Sensor(2,:));
NoS = NoS(2);
N_Max = 24; 

P_s_Measure = zeros(1, NoS);
P_s_SHDN = zeros(1, NoS);

for i = 1:NoS
    P_s_Measure(i) = VDD_TYP(i) * IDD_TYP_Measure(i);
    P_s_SHDN(i) = VDD_TYP(i) * IDD_TYP_SHDN(i);
end

%% Energy calculations
%Calculating the amount of energy per sensor needed per hour to do an amount of
%measurements per hour.
E_s_consumed = zeros(NoS, N_Max);
for i = 1:NoS
    for N = 1:N_Max
       E_s_consumed(i,N) = P_s_Measure(i)*T_conv_TYP(i)*N + P_s_SHDN(i)*(3600 - T_conv_TYP(i)*N);
    end    
end

%% make array of the results
%each row is other result, 
Results_calc_sensors = zeros(3,NoS, N_Max);
Results_calc_sensors(1,:,1) = P_s_Measure;
Results_calc_sensors(2,:,1) = P_s_SHDN;
for i = 1:NoS
    Results_calc_sensors(3,i,:) = E_s_consumed(i,:);
end

disp('finished the function calc_sensors');
end