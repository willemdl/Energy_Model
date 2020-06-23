%use this script if you don't want to use the app. 

close all

%% initialize parameters

[Batteries] = init_battery();
[Sensors] = init_sensors();
[MCU] = init_mcu();
[Transmission] = init_transmission();

T_Max = 3*24*3600;%maximum/minimum time in full system simulation
E_Max = 0; %maximum/minimum energy usage in full system simulation
N_Max = 24; %max number of simulations per day for the sensor calculations. 

%% perform calculations 
Selected_Batteries = Batteries;
R_Batteries = calc_batteries(Selected_Batteries);

Selected_Sensors = Sensors.Data(:,1:10);
Selected_Sensors_Names = Sensors.Name(:,1:10);
[Results_calc_sensors] = calc_sensors(Selected_Sensors, N_Max);

S_Sensors = [Sensors.Data(:,2) Sensors.Data(:,21) Sensors.Data(:,27)];
S_MCU = MCU.Data(:,2);
S_Com = Transmission.Data(:,2);
S_names = [Sensors.Name(1,2) Sensors.Name(1,21) Sensors.Name(1,27) MCU.Name(1,2) Transmission.Name(1,2) "Total"];
I_Array = [(3600) 1 1 1 1 1];
%I_Array first column = interval time in [s] second column = sensor 1, third column is sensor 2, etc untill all
% sensors have been defined to be on (1) or off(0) than follows the MCU and 
% lastly the communication. Make sure the order of sensors is of the same
% as the matrix S_Sensors.
losses = 0.2; %used in disp_totalenergy, is a factor of how much losses their are in the system
%this is equal and used for every component
[Results_calc_totalenergy] = calc_totalenergy(S_Sensors, S_MCU, S_Com, I_Array, T_Max, E_Max);

Results_calc_totalenergy.Name = S_names;

%% invoke plots and other graphical results

Save = false;
%https://nl.mathworks.com/matlabcentral/answers/102219-how-do-i-make-a-figure-full-screen-programmatically-in-matlab
%set(groot, 'defaultFigurePosition', get(0, 'Screensize'));
set(groot, 'defaultFigurePosition', 'factory');
set(0,'DefaultFigureWindowStyle','docked')  % 'normal' to un-dock
%disp_totalenergy(Results_calc_totalenergy, losses, Save);
disp_sensors(Results_calc_sensors, Selected_Sensors_Names, Save);
%disp_batteries(R_Batteries,Save);


