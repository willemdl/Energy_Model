clear all
close all
%% initialize parameters
[T_alive, E_available, Sensor, Sensorname, MCU, MCUname, Transmission, Transmissionname] = init_main();




%% perform calculations 
%[Results_calc_sensors, P_s_Measure, P_s_SHDN, E_s_consumed] = calc_sensors(Sensor);

S_Sensors = [Sensor(:,1) Sensor(:,3)];
S_MCU = MCU(:,1);
S_Com = Transmission(:,1);
S_names = [Sensorname(1,1) Sensorname(1,3) MCUname(1,1) Transmissionname(1,1)];
I_Array = [400 1 1 1 1; 600 1 0 1 0];
%I_Array first column = interval time in [s]
% second column = sensor 1, third column is sensor 2, etc untill all
% sensors have been defined to be on (1) or off(0) than follows the MCU and 
% lastly the communication. Make sure the order of sensors is of the same
% as the matrix S_Sensors.
[P_Total, E_Total, T_Total, measurements2, tijd, tltest] = calc_totalenergy(S_Sensors, S_MCU, S_Com, I_Array);


%% invoke plots and other graphical results
%disp_sensors(Results_calc_sensors, Sensorname);


