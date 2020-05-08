function [Sensor, Sensorname] = init_sensors()
disp('started init_sensors');
%Implemented as an function because that gives more insight in which
%parameters are defined and their names compared to a normal matlab script.
%the output of this function should be 1 big matrix, each column is a
%different sensor, each row is a different parameter. The following
%parameters need to be defined:
% 1) The name of the sensor.
% 2) default measurement rate. [n times per day]
% 3) Voltage at which the sensor operates. [V]
% 4) Current drawn during measurement. [mA]
% 5) Time it takes to do 1 measurement. [ms]
% 6) Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[] 
% 7) current drawn during standby / deepsleep.

%optionally:
% 1) the type of sensor.
% 2) accuracy? (stel dat je uiteindelijk een (automatisch) overzicht maakt met wat het model aanraad dan kan je dit in dat automatische verslagje meenemen)
% 3) wake up time and current/power drawn during wake up. 
% 4) power deviation in [%] 
% mxn m is row, n is column
Sensor = zeros(7,7);
Sensorname(1,1) = "TMP117"; %The name of the sensor
Sensor(2,1) = 24; %Default measurement rate [n times per day]
Sensor(3,1) = 3.3; %Voltage at which the sensor operates. [V] 
Sensor(4,1) = 0.135; %Current drawn during measurement. [mA]
Sensor(5,1) = 15.5; %Time it takes to do 1 measurement. [ms]
Sensor(6,1) = 1; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[] 
Sensor(7,1) = 0.00015;%current drawn during standby / deepsleep.[mA]


Sensorname(2,1) = "Si7051"; %The name of the sensor
Sensor(2,2) = 24; %Default measurement rate [n times per day]
Sensor(3,2) = 2.8; %Voltage at which the sensor operates. [V] 
Sensor(4,2) = 0.09; %Current drawn during measurement. [mA]
Sensor(5,2) = 7; %Time it takes to do 1 measurement. [ms]
Sensor(6,2) = 1; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[] 
Sensor(7,2) = 0.00006;%current drawn during standby / deepsleep.[mA]

disp('finished init_sensors');
end