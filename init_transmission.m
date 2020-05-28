function [Transmission] = init_transmission()
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
Parameters = ["Name","Default interval [s]","V_in [V]","I_Tx [mA]","T_Tx [s]", "I_Rx [mA]","T_Rx [s]", "I_normal [mA]", "T_normal [s]","I_ds [mA]"];

Transmissionname(1,1) = "TESTtrans";
Transmissiondata(2,1) = 24; %Default transmission rate. [n times per day]
Transmissiondata(3,1) = 3; %Voltage at which the transmission system operates. [V]
Transmissiondata(4,1) = 20; %Current drawn during Tx. [mA]
Transmissiondata(5,1) = 1; %Time of Tx. [s]
Transmissiondata(6,1) = 10; %Current drawn during Rx. [mA]
Transmissiondata(7,1) = 0.5; %Time of Rx. [s]
Transmissiondata(8,1) = 2; %Current drawn during other time. [mA]
Transmissiondata(9,1) = 3; %Time of other "standard" operation. [s]
Transmissiondata(10,1) = 0.01; %Current drawn during deep sleep. [mA]

if size(Parameters,2)~=(size(Transmissiondata,1)-1+size(Transmissionname,1))
    error("init_transmisssion: parameter names does not correspond to names and data");
end

Transmissiondata = Transmissiondata(:, any(Transmissiondata,1));
Transmission.Data = Transmissiondata;
Transmission.Name = Transmissionname;
Transmission.Parameters = Parameters; 
end