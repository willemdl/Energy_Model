function [Transmission, Transmissionname] = init_transmission()
%the output of this function should be 1 big matrix, each column is a
%different transmission method/configuration, each row is a different parameter. The following
%parameters need to be defined:
% 1) The name of the transmission method.
% 2) default transmission rate. [n times per day]
% 3) Voltage at which the transmission system operates. [V]
% 4) Current drawn during Tx. [mA]
% 5) Time of Tx. [s]
% 6) Current drawn during Rx. [mA]
% 7) Time of Rx. [s]
% 8) Current drawn during other time. [mA]
% 9) Time of other "standard" operation. [s]
% 10) Current drawn during deep sleep. [mA]


Transmissionname(1,1) = "TESTtrans";
Transmission(2,1) = 24; %Default transmission rate. [n times per day]
Transmission(3,1) = 3; %Voltage at which the transmission system operates. [V]
Transmission(4,1) = 20; %Current drawn during Tx. [mA]
Transmission(5,1) = 1; %Time of Tx. [s]
Transmission(6,1) = 10; %Current drawn during Rx. [mA]
Transmission(7,1) = 0.5; %Time of Rx. [s]
Transmission(8,1) = 2; %Current drawn during other time. [mA]
Transmission(9,1) = 3; %Time of other "standard" operation. [s]
Transmission(10,1) = 0.01; %Current drawn during deep sleep. [mA]
end