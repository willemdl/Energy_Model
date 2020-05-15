function [Sensordata, Sensorname] = init_sensors()
disp('started init_sensors');

%Implemented as an function because that gives more insight in which
%parameters are defined and their names compared to a normal matlab script.
%the output of this function should be 1 big matrix, each column is a
%different sensor, each row is a different parameter. The following
%parameters need to be defined:
% 1) The name of the sensor.
% 2) The type of sensor
% 3) default measurement rate. [n times per day]
% 4) Voltage at which the sensor operates. [V]
% 5) Current drawn during measurement. [mA]
% 6) Time it takes to do 1 measurement. [s]
% 7) Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
% 8) current drawn during standby / deepsleep. [mA]

%optionally:
% 2) accuracy (stel dat je uiteindelijk een (automatisch) overzicht maakt met wat het model aanraad dan kan je dit in dat automatische verslagje meenemen)
% 3) wake up time and current/power drawn during wake up. 
% 4) power deviation in [%] 
% mxn m is row, n is column

Sensordata = zeros(8,21);
%% Sensors[Temperature,Respiratory]
    
Sensorname(1,1) = "TP117";
Sensorname(2,1) = "Temperature";
Sensordata(3,1) = 24; %Default measurement rate [n times per day]
Sensordata(4,1) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(5,1) = 0.135; %Current drawn during measurement. [mA]
Sensordata(6,1) = 15.5 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,1) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,1) = 0.00015; %current drawn during standby / deepsleep.[mA]

Sensorname(1,2) = "Si7051"; %gekozen door sensorgroep
Sensorname(2,2) = "Temperature";
Sensordata(3,2) = 24; %Default measurement rate [n times per day]
Sensordata(4,2) = 2.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,2) = 0.09; %Current drawn during measurement. [mA]
Sensordata(6,2) = 7 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,2) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,2) = 0.00006;%current drawn during standby / deepsleep.[mA]

Sensorname(1,3) = "AS6212";
Sensorname(2,3) = "Temperature";
Sensordata(3,3) = 24; %Default measurement rate [n times per day]
Sensordata(4,3) = 3; %Voltage at which the sensor operates. [V] 
Sensordata(5,3) = 0.04; %Current drawn during measurement. [mA]
Sensordata(6,3) = 36 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,3) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,3) = 0.00010;%current drawn during standby / deepsleep.[mA]

Sensorname(1,4) = "MCP9808";
Sensorname(2,4) = "Temperature";
Sensordata(3,4) = 24; %Default measurement rate [n times per day]
Sensordata(4,4) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(5,4) = 0.2; %Current drawn during measurement. [mA]
Sensordata(6,4) = 250 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,4) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,4) = 0.00010;%current drawn during standby / deepsleep.[mA]

Sensorname(1,5) = "MAX30208";
Sensorname(2,5) = "Temperature";
Sensordata(3,5) = 24; %Default measurement rate [n times per day]
Sensordata(4,5) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,5) = 0.067; %Current drawn during measurement. [mA]
Sensordata(6,5) = 15 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,5) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,5) = 0.0005;%current drawn during standby / deepsleep.[mA]

Sensorname(1,6) = "MAX44006";
Sensorname(2,6) = "Temperature";
Sensordata(3,6) = 24; %Default measurement rate [n times per day]
Sensordata(4,6) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,6) = 0.01; %Current drawn during measurement. [mA]
Sensordata(6,6) = 400 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,6) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,6) = 0.01 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,7) = "TMP102"; %incompleet
Sensorname(2,7) = "Temperature";
Sensordata(3,7) = 24; %Default measurement rate [n times per day]
Sensordata(4,7) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(5,7) = 7 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,7) = 26 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,7) = 10 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,8) = "STTS751"; %
Sensorname(2,8) = "Temperature";
Sensordata(3,8) = 24; %Default measurement rate [n times per day]
Sensordata(4,8) = 3; %Voltage at which the sensor operates. [V] 
Sensordata(5,8) = 50 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,8) = 84 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,8) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,8) = 3 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,9) = "SMT172"; %36uJ/measurement
Sensorname(2,9) = "Temperature";
Sensordata(3,9) = 24; %Default measurement rate [n times per day]
Sensordata(4,9) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(5,9) = 60 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,9) = 1.8 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,9) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,9) = 220 * 10^-6;%current drawn during standby / deepsleep.[mA]

Sensorname(1,10) = "MAX30205";
Sensorname(2,10) = "Temperature";
Sensordata(3,10) = 24; %Default measurement rate [n times per day]
Sensordata(4,10) = 3; %Voltage at which the sensor operates. [V] 
Sensordata(5,10) = 600 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,10) = 44 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,10) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,10) = 1.65 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,11) = "LIS3DH"; %incompleet
Sensorname(2,11) = "Respiratory";
Sensordata(3,11) = 0; %Default measurement rate [n times per day]
Sensordata(4,11) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,11) = 0; %Current drawn during measurement. [mA]
Sensordata(6,11) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,11) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,11) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,12) = "MMA8491Q"; %incompleet
Sensorname(2,12) = "Respiratory";
Sensordata(3,12) = 0; %Default measurement rate [n times per day]
Sensordata(4,12) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,12) = 0; %Current drawn during measurement. [mA]
Sensordata(6,12) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,12) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,12) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,13) = "ADXL363"; %incompleet
Sensorname(2,13) = "Respiratory";
Sensordata(3,13) = 0; %Default measurement rate [n times per day]
Sensordata(4,13) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,13) = 0; %Current drawn during measurement. [mA]
Sensordata(6,13) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,13) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,13) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,14) = "ADXL362"; %incompleet
Sensorname(2,14) = "Respiratory";
Sensordata(3,14) = 0; %Default measurement rate [n times per day]
Sensordata(4,14) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,14) = 0; %Current drawn during measurement. [mA]
Sensordata(6,14) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,14) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,14) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,15) = "ADXL357"; %incompleet
Sensorname(2,15) = "Respiratory";
Sensordata(3,15) = 0; %Default measurement rate [n times per day]
Sensordata(4,15) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,15) = 0; %Current drawn during measurement. [mA]
Sensordata(6,15) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,15) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,15) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,16) = "ADXL345"; %incompleet
Sensorname(2,16) = "Respiratory";
Sensordata(3,16) = 0; %Default measurement rate [n times per day]
Sensordata(4,16) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,16) = 0; %Current drawn during measurement. [mA]
Sensordata(6,16) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,16) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,16) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,17) = "BMA423"; %incompleet
Sensorname(2,17) = "Respiratory";
Sensordata(3,17) = 0; %Default measurement rate [n times per day]
Sensordata(4,17) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,17) = 0; %Current drawn during measurement. [mA]
Sensordata(6,17) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,17) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,17) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,18) = "BMA456"; %incompleet
Sensorname(2,18) = "Respiratory";
Sensordata(3,18) = 0; %Default measurement rate [n times per day]
Sensordata(4,18) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,18) = 0; %Current drawn during measurement. [mA]
Sensordata(6,18) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,18) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,18) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,19) = "BMA280"; %incompleet
Sensorname(2,19) = "Respiratory";
Sensordata(3,19) = 0; %Default measurement rate [n times per day]
Sensordata(4,19) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,19) = 0; %Current drawn during measurement. [mA]
Sensordata(6,19) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,19) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,19) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,20) = "LIS2DS12"; %incompleet
Sensorname(2,20) = "Respiratory";
Sensordata(3,20) = 0; %Default measurement rate [n times per day]
Sensordata(4,20) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,20) = 0; %Current drawn during measurement. [mA]
Sensordata(6,20) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,20) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,20) = 0;%current drawn during standby / deepsleep.[mA]

Sensorname(1,21) = "IIS2DLPC"; %incompleet
Sensorname(2,21) = "Respiratory";
Sensordata(3,21) = 0; %Default measurement rate [n times per day]
Sensordata(4,21) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(5,21) = 0; %Current drawn during measurement. [mA]
Sensordata(6,21) = 0; %Time it takes to do 1 measurement. [s]
Sensordata(7,21) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,21) = 0;%current drawn during standby / deepsleep.[mA]

disp(Sensordata);
disp('finished init_sensors');
end