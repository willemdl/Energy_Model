function [Sensor] = init_sensors2()
%Implemented as an function because that gives more insight in which
%parameters are defined and their names compared to a normal matlab script.
% each column is a different sensor, each row is a different parameter. 
%The following parameters need to be defined for sensors:
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
NoS = 27;
for k=1:NoS
    Sensor(k) = SensorsClass;
end
k=1;
Sensor(1,k).Name(1) = "TP117";
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.135; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 15.5 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.00015; %current drawn during standby / deepsleep.[mA]

k=2;
Sensor(1,k).Name(1) = "Si7051"; %gekozen door sensorgroep
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 2.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.09; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 7 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.00006;%current drawn during standby / deepsleep.[mA]

k=3;
Sensor(1,k).Name(1) = "AS6212";
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.04; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 36 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.00010;%current drawn during standby / deepsleep.[mA]

k=4;
Sensor(1,k).Name(1) = "MCP9808";
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.2; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 250 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.00010;%current drawn during standby / deepsleep.[mA]

k=5;
Sensor(1,k).Name(1) = "MAX30208";
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.067; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 15 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.0005;%current drawn during standby / deepsleep.[mA]

k=6;
Sensor(1,k).Name(1) = "MAX44006";
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.01; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 400 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 1 * 10^-3; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.01 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=7;
Sensor(1,k).Name(1) = "TMP102"; 
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 7 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 26 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 10 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=8;
Sensor(1,k).Name(1) = "STTS751"; 
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 50 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 84 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 3 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=9;
Sensor(1,k).Name(1) = "SMT172"; %36uJ/measurement
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 60 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 1.8 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 220 * 10^-6;%current drawn during standby / deepsleep.[mA]

k=10;
Sensor(1,k).Name(1) = "MAX30205";
Sensor(1,k).Name(2) = "Temperature";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 600 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 44 * 10^-3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 1.65 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=11;
Sensor(1,k).Name(1) = "LIS3DH";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 2.5; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 20 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=12;
Sensor(1,k).Name(1) = "MMA8491Q";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 40 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.002 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=13;
Sensor(1,k).Name(1) = "ADXL363";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.5; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 13 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.01 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=14;
Sensor(1,k).Name(1) = "ADXL362";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.5; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 13 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.01 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=15;
Sensor(1,k).Name(1) = "ADXL357";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 200 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 21 * 10^-3 ;%current drawn during standby / deepsleep.[mA]

k=16;
Sensor(1,k).Name(1) = "ADXL345";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 2.5; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 50 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 3.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=17;
Sensor(1,k).Name(1) = "BMA423";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 22 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 3.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=18;
Sensor(1,k).Name(1) = "BMA456";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 22 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 3.5 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=19;
Sensor(1,k).Name(1) = "BMA280";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 2.4; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 22 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 2.1 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=20;
Sensor(1,k).Name(1) = "LIS2DS12";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 150 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 60; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.7 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=21;
Sensor(1,k).Name(1) = "IIS2DLPC";
Sensor(1,k).Name(2) = "Respiratory";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 90 * 10^-3; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 30; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.05 * 10^-3;%current drawn during standby / deepsleep.[mA]

%NOTE VOOR VERSLAG: Heartrate sensor heeft LEDs die aan en uitgaan in
%pulses.. LEDs kosten natuurlijk veel meer current (=meer power) en dus in
%dit model is er vanuit gegaan dat en 1/10de van de meting de LEDs aan
%staan: dus 3s (MOET BETER NAAR WORDEN GEKEKEN IN VERSLAG)

k=22;
Sensor(1,k).Name(1) = "MAX30101"; %LEDs operate on 5V: the current is increased.
Sensor(1,k).Name(2) = "HeartRate";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.6; %Current drawn during measurement. [mA] (!!!)
Sensor(1,k).Data(6) = 30; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.7 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=23;
Sensor(1,k).Name(1) = "MAX30102";
Sensor(1,k).Name(2) = "HeartRate";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.6; %Current drawn during measurement. [mA] (!!!)
Sensor(1,k).Data(6) = 30; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.7 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=24;
Sensor(1,k).Name(1) = "MAXM86161";
Sensor(1,k).Name(2) = "HeartRate";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 1.8; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(8) = 0.5; %Current drawn during measurement. [mA] (!!!)
Sensor(1,k).Data(8) = 30; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(8) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 1.6 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=25;
Sensor(1,k).Name(1) = "OB1203";
Sensor(1,k).Name(2) = "HeartRate";
Sensor(1,k).Data(8) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(8) = 2.65; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(8) = 0.5; %Current drawn during measurement. [mA] (!!!)
Sensor(1,k).Data(8) = 30; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(8) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 2 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=26;
Sensor(1,k).Name(1) = "BH1790GLC";
Sensor(1,k).Name(2) = "HeartRate";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 0.34 * 1.067; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 30; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0.8 * 10^-3;%current drawn during standby / deepsleep.[mA]

k=27;
Sensor(1,k).Name(1) = "Bilirubin";
Sensor(1,k).Name(2) = "bilirubin";
Sensor(1,k).Data(3) = 24; %Default measurement rate [n times per day]
Sensor(1,k).Data(4) = 3.7; %Voltage at which the sensor operates. [V] 
Sensor(1,k).Data(5) = 45; %Current drawn during measurement. [mA]
Sensor(1,k).Data(6) = 3; %Time it takes to do 1 measurement. [s]
Sensor(1,k).Data(7) = 0.001; %Time to process/change data of 1 measurement based on a clock frequency of 32Mhz.[s] 
Sensor(1,k).Data(8) = 0;%current drawn during standby / deepsleep.[mA]

% if size(Parameters~=(size(Sensor(:).Data(:)-2+size(Sensor(:).Name(:))
%     error("init_MCU: parameter names does not correspond to names and data");
% end





% Sensors = SensorsClass;%class defined in Classes folder
% Sensors.Data = Sensor(1,k).Data(8);
% Sensors.Name = Sensor.Name;
% Sensors.Parameters = Parameters; 
end