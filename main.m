%% initialize parameters
[Sensor, Sensorname] = init_main();




%% perform calculations 

[Results_calc_sensors, P_s_Measure, P_s_SHDN, E_s_consumed] = calc_sensors(Sensor);


%% invoke plots and other graphical results


