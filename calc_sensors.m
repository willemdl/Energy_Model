function [Results_calc_sensors, P_S_Measure, P_S_DS, E_S_consumed_DS] = calc_sensors(Sensor, N_Max)
disp('started the function calc_sensors');
%% Power calculations
%Calculating the amount of power consumed per sensor for one day when 
% measuring and when in 'shut down' mode.
%inputs: 
%   Sensor is an matrix, each row is an variable (same as in
%   init_sensors.m) and each column is an sensor.
%   N_Max is the maximum number of measurements during one day. If N_Max =0
%   than the default value specified in init_sensor will be taken. 

%output:
% Results_calc_sensors is an matrix, 
%   each row is another Sensor
%   each column is another Parameter (power in DS, Power when measuring,
%   total energy, energy only due to measurements.)

VDD_TYP = Sensor(4,:);%V
IDD_TYP_Measure = Sensor(5,:);%mA
IDD_TYP_SHDN = Sensor(8,:);%mA
T_Measurement = Sensor(6,:);%s
NoS = size(Sensor,2);%determines how many sensors are in the Sensor matrix
T_Total = 24*3600;%Is set to one day, thus energy usage will be calculated for one day 
%--------------- in resultaat ook "rij" met alleen energie toename door
%metingen


P_S_Measure = zeros(1, NoS);
P_S_DS = zeros(1, NoS);

for i = 1:NoS
    P_S_Measure(i) = VDD_TYP(i) * IDD_TYP_Measure(i);%mW 
    E_S_Meaure(i) = P_S_Measure(i)*T_Measurement(i);%mJ
    P_S_DS(i) = VDD_TYP(i) * IDD_TYP_SHDN(i);%mW
end

%% Energy calculations
%Calculating the amount of energy per sensor needed per day to do an amount of
%measurements per day.
E_S_consumed_DS = zeros(NoS, 50); %Energy consumed with Deep Sleep and measurement
E_S_consumed_M = zeros(NoS, 50); %energy consumed by the measurement only 

for i = 1:NoS
    if N_Max ==0
        N_Max2= Sensor(3,i);
    else
        N_Max2 = N_Max;
    end
    
    for N = 1:1:N_Max2
        E_S_consumed_DS(i,N) = P_S_Measure(i)*T_Measurement(i)*N + P_S_DS(i)*(T_Total - T_Measurement(i)*N);%mJ
        E_S_consumed_M(i,N) = P_S_Measure(i)*T_Measurement(i)*N;%mJ
    end
end
%truncate the matrices because initialisation with zeros can't happen
%precisely 
E_S_consumed_DS =  E_S_consumed_DS(:,any(E_S_consumed_DS,1));
E_S_consumed_M =  E_S_consumed_M(:,any(E_S_consumed_M,1));


%% make array of the results
%each row is other result,
Results_calc_sensors = zeros(NoS, 4, size(E_S_consumed_DS,2));

Results_calc_sensors(:,1,1) = P_S_DS;
Results_calc_sensors(:,2,1) = P_S_Measure;
for i = 1:NoS
    Results_calc_sensors(i,3,:) = E_S_consumed_DS(i,:);
    Results_calc_sensors(i,4,:) = E_S_consumed_M(i,:);
end

disp('finished the function calc_sensors');
end