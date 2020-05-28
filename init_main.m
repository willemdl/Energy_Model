function [T_alive, E_available, Sensors,  MCU, Transmission, Transmissionname] = init_main()
disp('started init_main program');
T_alive = 3*24*3600; %Time that the sensorpatch needs to function. [s]
E_available = 3*0.001*3600; %Amount of available energy. [J]
%Sensorsdata, Sensorname,
[Sensors] = init_sensors();
[MCU] = init_mcu();
[Transmission] = init_transmission();


disp('finished init_main program');
end