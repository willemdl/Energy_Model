function [MCU] = init_mcu()
%the output of this function should be 1 big variable, each column is a
%different MCU, each row is a different parameter. The following
%parameters need to be defined:
% 1) The name of the MCU.
% 2) Default measurement rate. [n times per day]
% 3) Voltage at which the microcontroller operates. [V]
% 4) Current drawn when active. [mA/MHz]
% 5) Extra time in active mode. [s]
% 6) Wake up time. [s]
% 7) Current drawn during standby / deepsleep.[mA]
% 8) Base clock frequency. [MHz]

% Eventually the total "active" (non deepsleep) time of the microcontroller
% will be determined by the wake up time, measurement time of sensor(s),
% total transmission time and some "standard time"(time controller needs to
% take in order to keep the system in good conditions).
Parameters = ["Name","Default interval [s]","V_in [V]","I_active [mA/MHz]","T_extra [s]", "T_WakeUp", "I_ds [mA]", "clock freq [MHz]"];

MCUdata = zeros(8,8);
MCUname(1,1)= "TESTMCU";
MCUdata(2,1) = 24; %Default measurement rate. [n times per day]
MCUdata(3,1) = 3.0; %Voltage at which the microcontroller operates. [V]
MCUdata(4,1) = 0.1; %Current drawn when active. [mA/MHz]
MCUdata(5,1) = 2; %Extra time in active mode. [s]
MCUdata(6,1) = 0.0001; %Wake up time. [s]
MCUdata(7,1) = 0.010; %Current drawn during standby / deepsleep.[mA]
MCUdata(8,1) = 32; %Base clock frequency. [MHz]

MCUname(1,2)= "MSP430FR5994";
MCUdata(2,2) = 24; %Default measurement rate. [n times per day]
MCUdata(3,2) = 3.0; %Voltage at which the microcontroller operates. [V]
MCUdata(4,2) = 0.185; %Current drawn when active. [mA/MHz]
MCUdata(5,2) = 2; %Extra time in active mode. [s]
MCUdata(6,2) = 0.001; %Wake up time. [s]
MCUdata(7,2) = 0.001; %Current drawn during standby / deepsleep.[mA]
MCUdata(8,2) = 4; %Base clock frequency. [MHz]

if size(Parameters,2)~=(size(MCUdata,1)-1+size(MCUname,1))
    error("init_MCU: parameter names does not correspond to names and data");
end
MCUdata = MCUdata(:, any(MCUdata,1));

MCU = MCUClass; %class defined in Classes folder
MCU.Data = MCUdata;
MCU.Name = MCUname;
MCU.Parameters = Parameters;
end