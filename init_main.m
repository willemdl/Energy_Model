function [T_alive, E_available, Sensors, Sensorname, MCU, MCUname, Transmission, Transmissionname] = init_main()
disp('started init_main program');
T_alive = 3*24*3600; %Time that the sensorpatch needs to function. [s]
E_available = 3*0.001*3600; %Amount of available energy. [J]

[Sensors, Sensorname] = init_sensors();
[MCU, MCUname] = init_mcu();
[Transmission, Transmissionname] = init_transmission();


disp('finished init_main program');
end