% Author: Giuseppe Gianfranceschi
% Simulation to determine the impact of payload size on the average current
% of a BLE module
%
clear all
%% Module specs
PHY_speed = 2E+6; %bps
I_TX = 6.7E-3; %Ampere
I_RX = 7.1E-3; %Ampere
I_switch = 3.5E-3; %Ampere
I_sleep = 2.4E-6; %Ampere

%% Data to be sent
Min_bits = 8;
Bit_incr = 8;
Max_bits = 120000;
Data = [Min_bits:Bit_incr:Max_bits]; %in Bits

%% Total time before another transmission
T_total = 60*60; % in seconds

%% Setting data length extension
DLE = true; %Data length extension
if DLE
    LL_packet = 265; %Bytes
else
    LL_packet = 41; %Bytes
end

%% Size of payload and acknownledgment package
Ack_packet = 10; %Bytes
Overhead = 14; %Bytes
Headers = 3 + 4; %Bytes
Payload = LL_packet - Overhead - Headers;

%% Caculate operation times
T_TX = ((LL_packet*8)/PHY_speed);
T_RX = ((Ack_packet*8)/PHY_speed);
T_IFS = 150E-6; %Seconds

T_packet = 2*T_IFS + T_TX + T_RX; %Total time it takes for a FULL payload to be transmitted and receive an acknowlegement
I_packet = (2*T_IFS*I_switch + T_TX*I_TX + T_RX*I_RX)/T_packet; % Average current per FULL packet

%% Determine amount of full packets to be sent
N_packets = floor((Data/8)/Payload); % Number of full packets to be sent
T_data = T_packet * N_packets; % Time it takes to transmit full packets

%% Last packet calculations
Rem_data = mod((Data/8),Payload);
T_rem_data = 2*T_IFS + T_RX + (((Rem_data+Overhead+Headers)*8)./PHY_speed);
I_rem_data = (2*T_IFS*I_switch + (((Rem_data+Overhead+Headers)*8)./PHY_speed)*I_TX + T_RX*I_RX)./T_rem_data;

%% Determine total average current within T_total
I_avg = (((T_total - T_data - T_rem_data) * I_sleep) + T_data*I_packet + T_rem_data.*I_rem_data)/T_total;
line = ones(1,length(Data)) * I_sleep; % Reference line for data=0 (sleep mode)

%% Plot results
plot(Data, I_avg*1e6);
hold on;
plot(Data, line*1e6);
xlabel('Data [bits]');
ylabel('Average current [uA]');
legend('Simulation','Sleep current');
y_spacing = 0.01;
ylim([(1-y_spacing)*I_sleep*1e6, (1+y_spacing)*I_avg(end)*1e6]);
