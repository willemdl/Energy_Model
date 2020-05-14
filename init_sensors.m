function [Sensordata, Sensorname] = init_sensors()
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
% 2) accuracy? (stel dat je uiteindelijk een (automatisch) overzicht maakt met wat het model aanraad dan kan je dit in dat automatische verslagje meenemen)
% 3) wake up time and current/power drawn during wake up. 
% 4) power deviation in [%] 
% mxn m is row, n is column

Sensordata = zeros(6,6);
info_str = ["TMP117","Si7051","AS6212","MCP9808","MAX30208","MAX44006","TMP102";
            "Temp","Temp","Temp","Temp","Temp","Temp","Temp"]
    
%TMP117
%Temperatuur
Sensordata(1,1) = 24; %Default measurement rate [n times per day]
Sensordata(2,1) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(3,1) = 0.135; %Current drawn during measurement. [mA]
Sensordata(4,1) = 15.5 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(5,1) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,1) = 0.00015;%current drawn during standby / deepsleep.[mA]

%Si7051
%Temperatuur
Sensordata(1,2) = 24; %Default measurement rate [n times per day]
Sensordata(2,2) = 2.8; %Voltage at which the sensor operates. [V] 
Sensordata(3,2) = 0.09; %Current drawn during measurement. [mA]
Sensordata(4,2) = 7 * 10^-3; %Time it takes to do 1 measurement. [ms]
Sensordata(5,2) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,2) = 0.00006;%current drawn during standby / deepsleep.[mA]

%AS6212
%Temperatuur
Sensordata(1,3) = 24; %Default measurement rate [n times per day]
Sensordata(2,3) = 3; %Voltage at which the sensor operates. [V] 
Sensordata(3,3) = 0.04; %Current drawn during measurement. [mA]
Sensordata(4,3) = 36 * 10^-3; %Time it takes to do 1 measurement. [ms]
Sensordata(5,3) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,3) = 0.00010;%current drawn during standby / deepsleep.[mA]

%MCP9808
%Temperatuur
Sensordata(1,4) = 24; %Default measurement rate [n times per day]
Sensordata(2,4) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(3,4) = 0.2; %Current drawn during measurement. [mA]
Sensordata(4,4) = 250 * 10^-3; %Time it takes to do 1 measurement. [ms]
Sensordata(5,4) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,4) = 0.00010;%current drawn during standby / deepsleep.[mA]

%MAX30208
%Temperatuur
Sensordata(1,5) = 24; %Default measurement rate [n times per day]
Sensordata(2,5) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(3,5) = 0.067; %Current drawn during measurement. [mA]
Sensordata(4,5) = 15 * 10^-3; %Time it takes to do 1 measurement. [ms]
Sensordata(5,5) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,5) = 0.0005;%current drawn during standby / deepsleep.[mA]

%MAX44006
%Temperatuur
Sensordata(1,6) = 24; %Default measurement rate [n times per day]
Sensordata(2,6) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(3,6) = 0.01; %Current drawn during measurement. [mA]
Sensordata(4,6) = 400 * 10^-3; %Time it takes to do 1 measurement. [ms]
Sensordata(5,6) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,6) = 0.00001;%current drawn during standby / deepsleep.[mA]

%Naam: TMP102
%Type: Temperatuur
Sensordata(1,7) = 24; %Default measurement rate [n times per day]
Sensordata(2,7) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(3,7) = 0.007; %Current drawn during measurement. [mA]
Sensordata(4,7) = 26 * 10^-3; %Time it takes to do 1 measurement. [ms]
Sensordata(5,7) = 0; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,7) = 0;%current drawn during standby / deepsleep.[mA]

%Naam:
%Type: Temperatuur
Sensordata(1,6) = 0; %Default measurement rate [n times per day]
Sensordata(2,6) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(3,6) = 0; %Current drawn during measurement. [mA]
Sensordata(4,6) = 0; %Time it takes to do 1 measurement. [ms]
Sensordata(5,6) = 0; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,6) = 0;%current drawn during standby / deepsleep.[mA]

%Naam:
%Type: Temperatuur
Sensordata(1,6) = 0; %Default measurement rate [n times per day]
Sensordata(2,6) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(3,6) = 0; %Current drawn during measurement. [mA]
Sensordata(4,6) = 0; %Time it takes to do 1 measurement. [ms]
Sensordata(5,6) = 0; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,6) = 0;%current drawn during standby / deepsleep.[mA]

%Naam:
%Type: Temperatuur
Sensordata(1,6) = 0; %Default measurement rate [n times per day]
Sensordata(2,6) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(3,6) = 0; %Current drawn during measurement. [mA]
Sensordata(4,6) = 0; %Time it takes to do 1 measurement. [ms]
Sensordata(5,6) = 0; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,6) = 0;%current drawn during standby / deepsleep.[mA]

%Naam:
%Type: Temperatuur
Sensordata(1,6) = 0; %Default measurement rate [n times per day]
Sensordata(2,6) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(3,6) = 0; %Current drawn during measurement. [mA]
Sensordata(4,6) = 0; %Time it takes to do 1 measurement. [ms]
Sensordata(5,6) = 0; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,6) = 0;%current drawn during standby / deepsleep.[mA]

%Naam:
%Type: Temperatuur
Sensordata(1,6) = 0; %Default measurement rate [n times per day]
Sensordata(2,6) = 0; %Voltage at which the sensor operates. [V] 
Sensordata(3,6) = 0; %Current drawn during measurement. [mA]
Sensordata(4,6) = 0; %Time it takes to do 1 measurement. [ms]
Sensordata(5,6) = 0; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(6,6) = 0;%current drawn during standby / deepsleep.[mA]

disp(Sensordata);
disp('finished init_sensors');
end