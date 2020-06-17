close all
%% initialize parameters
[T_alive, E_available,Sensors, MCU, Transmission] = init_main();

%% perform calculations 
N_Max = 0;


%[Results_calc_sensors, P_s_Measure, P_s_SHDN, E_s_consumed] = calc_sensors(Sensors.Data, N_Max);

S_Sensors = [Sensors.Data(:,2) Sensors.Data(:,21) Sensors.Data(:,27)];
S_MCU = MCU.Data(:,2);
S_Com = Transmission.Data(:,2);
S_names = [Sensors.Name(1,2) Sensors.Name(1,21) Sensors.Name(1,27) MCU.Name(1,2) Transmission.Name(1,2) "Total"];
I_Array = [(3600) 1 1 1 1 1];
T_Max = 3*24*3600;
E_Max = 0;
%I_Array first column = interval time in [s]
% second column = sensor 1, third column is sensor 2, etc untill all
% sensors have been defined to be on (1) or off(0) than follows the MCU and 
% lastly the communication. Make sure the order of sensors is of the same
% as the matrix S_Sensors.
[Results_calc_totalenergy] = calc_totalenergy(S_Sensors, S_MCU, S_Com, I_Array, T_Max, E_Max);
%[Results_calc_totalenergy] = calc_fullsystem(S_Sensors, S_MCU, S_Com, I_Array, T_Max, E_Max);

Results_calc_totalenergy.Name = S_names;

%% invoke plots and other graphical results
%https://nl.mathworks.com/matlabcentral/answers/102219-how-do-i-make-a-figure-full-screen-programmatically-in-matlab
%set(groot, 'defaultFigurePosition', get(0, 'Screensize'));
set(groot, 'defaultFigurePosition', 'factory');
set(0,'DefaultFigureWindowStyle','docked')  % 'normal' to un-dock
disp_totalenergy(Results_calc_totalenergy);
%disp_sensors(Results_calc_sensors, Sensors.Name);


