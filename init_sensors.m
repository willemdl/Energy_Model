function [Sensors] = init_sensors()

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

Parameters = ["Name","Type", "Default interval [s]","V_in [V]","I_m [mA]","T_m [s]","T_pr [s]","I_ds [mA]"];

%optionally:
% 2) accuracy (stel dat je uiteindelijk een (automatisch) overzicht maakt met wat het model aanraad dan kan je dit in dat automatische verslagje meenemen)
% 3) wake up time and current/power drawn during wake up. 
% 4) power deviation in [%] 
% mxn m is row, n is column
Sensordata = zeros(8,26);

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

Sensorname(1,7) = "TMP102"; 
Sensorname(2,7) = "Temperature";
Sensordata(3,7) = 24; %Default measurement rate [n times per day]
Sensordata(4,7) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(5,7) = 7 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,7) = 26 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensordata(7,7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,7) = 10 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,8) = "STTS751"; 
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

Sensorname(1,11) = "LIS3DH";
Sensorname(2,11) = "Respiratory";
Sensordata(3,11) = 24; %Default measurement rate [n times per day]
Sensordata(4,11) = 2.5; %Voltage at which the sensor operates. [V] 
Sensordata(5,11) = 20 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,11) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,11) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,11) = 0.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,12) = "MMA8491Q";
Sensorname(2,12) = "Respiratory";
Sensordata(3,12) = 24; %Default measurement rate [n times per day]
Sensordata(4,12) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,12) = 40 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,12) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,12) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,12) = 0.002 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,13) = "ADXL363";
Sensorname(2,13) = "Respiratory";
Sensordata(3,13) = 24; %Default measurement rate [n times per day]
Sensordata(4,13) = 3.5; %Voltage at which the sensor operates. [V] 
Sensordata(5,13) = 13 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,13) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,13) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,13) = 0.01 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,14) = "ADXL362";
Sensorname(2,14) = "Respiratory";
Sensordata(3,14) = 24; %Default measurement rate [n times per day]
Sensordata(4,14) = 3.5; %Voltage at which the sensor operates. [V] 
Sensordata(5,14) = 13 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,14) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,14) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,14) = 0.01 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,15) = "ADXL357";
Sensorname(2,15) = "Respiratory";
Sensordata(3,15) = 24; %Default measurement rate [n times per day]
Sensordata(4,15) = 3.3; %Voltage at which the sensor operates. [V] 
Sensordata(5,15) = 200 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,15) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,15) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,15) = 21 * 10^-3 ;%current drawn during standby / deepsleep.[mA]

Sensorname(1,16) = "ADXL345";
Sensorname(2,16) = "Respiratory";
Sensordata(3,16) = 24; %Default measurement rate [n times per day]
Sensordata(4,16) = 2.5; %Voltage at which the sensor operates. [V] 
Sensordata(5,16) = 50 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,16) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,16) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,16) = 3.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,17) = "BMA423";
Sensorname(2,17) = "Respiratory";
Sensordata(3,17) = 24; %Default measurement rate [n times per day]
Sensordata(4,17) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,17) = 22 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,17) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,17) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,17) = 3.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,18) = "BMA456";
Sensorname(2,18) = "Respiratory";
Sensordata(3,18) = 24; %Default measurement rate [n times per day]
Sensordata(4,18) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,18) = 22 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,18) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,18) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,18) = 3.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,19) = "BMA280";
Sensorname(2,19) = "Respiratory";
Sensordata(3,19) = 24; %Default measurement rate [n times per day]
Sensordata(4,19) = 2.4; %Voltage at which the sensor operates. [V] 
Sensordata(5,19) = 22 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,19) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,19) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,19) = 2.1 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,20) = "LIS2DS12";
Sensorname(2,20) = "Respiratory";
Sensordata(3,20) = 24; %Default measurement rate [n times per day]
Sensordata(4,20) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,20) = 150 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,20) = 60; %Time it takes to do 1 measurement. [s]
Sensordata(7,20) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,20) = 0.7 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,21) = "IIS2DLPC";
Sensorname(2,21) = "Respiratory";
Sensordata(3,21) = 24; %Default measurement rate [n times per day]
Sensordata(4,21) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,21) = 90 * 10^-3; %Current drawn during measurement. [mA]
Sensordata(6,21) = 30; %Time it takes to do 1 measurement. [s]
Sensordata(7,21) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,21) = 0.05 * 10^-3;%current drawn during standby / deepsleep.[mA]

%NOTE VOOR VERSLAG: Heartrate sensor heeft LEDs die aan en uitgaan in
%pulses.. LEDs kosten natuurlijk veel meer current (=meer power) en dus in
%dit model is er vanuit gegaan dat en 1/10de van de meting de LEDs aan
%staan: dus 3s (MOET BETER NAAR WORDEN GEKEKEN IN VERSLAG)

Sensorname(1,22) = "MAX30101"; %LEDs operate on 5V: the current is increased.
Sensorname(2,22) = "HeartRate";
Sensordata(3,22) = 24; %Default measurement rate [n times per day]
Sensordata(4,22) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,22) = 0.6; %Current drawn during measurement. [mA] (!!!)
Sensordata(6,22) = 30; %Time it takes to do 1 measurement. [s]
Sensordata(7,22) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,22) = 0.7 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,23) = "MAX30102";
Sensorname(2,23) = "HeartRate";
Sensordata(3,23) = 24; %Default measurement rate [n times per day]
Sensordata(4,23) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,23) = 0.6; %Current drawn during measurement. [mA] (!!!)
Sensordata(6,23) = 30; %Time it takes to do 1 measurement. [s]
Sensordata(7,23) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,23) = 0.7 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,24) = "MAXM86161";
Sensorname(2,24) = "HeartRate";
Sensordata(3,24) = 24; %Default measurement rate [n times per day]
Sensordata(4,24) = 1.8; %Voltage at which the sensor operates. [V] 
Sensordata(5,24) = 0.5; %Current drawn during measurement. [mA] (!!!)
Sensordata(6,24) = 30; %Time it takes to do 1 measurement. [s]
Sensordata(7,24) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,24) = 1.6 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,25) = "OB1203";
Sensorname(2,25) = "HeartRate";
Sensordata(3,25) = 24; %Default measurement rate [n times per day]
Sensordata(4,25) = 2.65; %Voltage at which the sensor operates. [V] 
Sensordata(5,25) = 0.5; %Current drawn during measurement. [mA] (!!!)
Sensordata(6,25) = 30; %Time it takes to do 1 measurement. [s]
Sensordata(7,25) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,25) = 2 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,26) = "BH1790GLC";
Sensorname(2,26) = "HeartRate";
Sensordata(3,26) = 24; %Default measurement rate [n times per day]
Sensordata(4,26) = 3; %Voltage at which the sensor operates. [V] 
Sensordata(5,26) = 0.34 * 1.067; %Current drawn during measurement. [mA]
Sensordata(6,26) = 30; %Time it takes to do 1 measurement. [s]
Sensordata(7,26) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,26) = 0.8 * 10^-3;%current drawn during standby / deepsleep.[mA]

Sensorname(1,27) = "bilitest";
Sensorname(2,27) = "bilirubine";
Sensordata(3,27) = 24; %Default measurement rate [n times per day]
Sensordata(4,27) = 4.5; %Voltage at which the sensor operates. [V] 
Sensordata(5,27) = 50; %Current drawn during measurement. [mA]
Sensordata(6,27) = 0.015; %Time it takes to do 1 measurement. [s]
Sensordata(7,27) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensordata(8,27) = 0;%current drawn during standby / deepsleep.[mA]

if size(Parameters,2)~=(size(Sensordata,1)-2+size(Sensorname,1))
    error("init_MCU: parameter names does not correspond to names and data");
end



Sensors = SensorsClass;%class defined in Classes folder
Sensors.Data = Sensordata;
Sensors.Name = Sensorname;
Sensors.Parameters = Parameters; 
end