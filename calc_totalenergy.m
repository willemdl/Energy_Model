function [P_Total, E_Total, T_Total, measurements2, time, tltest] = calc_totalenergy(S_Sensors, S_MCU, S_Com, I_Array)
disp('Started calc_totalenergy function');
%input; one array with the sensors that will be used,
%one vector with MCU parameters, one vector with transmission parameters.
%One array with the

%output; 2 vectors/arrays 1 with energy in mili Joule [mJ] and one with the time. seperate time
%vectors will be outputed in order to easily plot and use the energy data.
%energy array; each column is one energy calculation and each row is the
%amount of energy at each time.

%% General information about this function
% The values for power variables are in mW and thus energy is in mJ
% additionally the time is in seconds
% The following assumptions have been made: 1) The time between 2
% intervals is larger than it takes to perform actions required for 1
% interval. 2) The MCU is active while measurements with sensors are
% performed

%% initialisation of function specific variables

[~, NoS] = size(S_Sensors); %NoS = Number of Sensors
P_M_S = zeros(NoS); %P_M_ means power during Measurement _S refers to Sensor
P_DS_S = zeros(NoS); %P_S_ means power during Deep Sleep _S refers to Sensor

dt = 1;%Step size of the time.[s] bare in mind that if dt is too large
%than calculations wil be wrong.
t=2;%This is the actual time which will be stored in time()
z=1;%This is used to keep track of how often and when measurement takes place.
T_Total = 500000;

% T_Processing is the total time the MCU spends on processing the measured data.
measurements2 = zeros(100,NoS+2);
time = zeros(100,1);
P_Total = zeros(T_Total/dt,1);
E_Total = zeros(T_Total/dt,1);
tltest = zeros(T_Total/dt,1);

%% The large loop
for i=1:1:NoS
    P_DS_S(i) = S_Sensors(3,i)*S_Sensors(7,i);%in mW (3,i)=[V] (7,i)=mA
end
P_DS_MCU = S_MCU(3,1)*S_MCU(7,1);%in mW
P_DS_Com = S_Com(3,1)*S_Com(10,1);%in mW

while t < T_Total
    
    %% Energy usage during sleep
    P_DS_tot = sum(P_DS_S(:))+P_DS_MCU +P_DS_Com;
    P_Total(t) = P_DS_tot;
    E_Total(t) = E_Total(t-dt)+P_DS_tot*dt;
    t= t+dt;
    
    %% Energy usage during activities
    if mod(t,1)==0 %this is an easier check than the next if thus should make the matlab script faster
        if any(mod(t,I_Array(:,1)) == 0) %gives true if any interval is true
            measurements = I_Array(find(~mod(t,I_Array(:,1))),2:end);%gives an vector of all
            measurements2(z,:) = sum(measurements,1);
            time(z) = t;%gives an vector with the times at which the if statement was true,
            %in order to check this easily
            
            %% Energy usage during wake up stage [_WU_]
            % It has been assumed that only the MCU has an wake up stage,
            % the rest remains in Deep Sleep.
            P_WU = 1;
            P_DS_rest = sum(P_DS_S(:)) +P_DS_Com;
            P_WU_tot = P_WU+ P_DS_rest;
            for tl=0:dt:S_MCU(6,1)
                P_Total(t) = P_WU_tot;
                E_Total(t) = E_Total(t-dt) +P_WU_tot*dt;
                tltest(t) = tl;
                t = t+dt;
            end
            %% Energy usage measurement stage [_M_]
            % S_Sensors(x,1) x=3 -> voltage x=4-> current during measurement
            % x=5-> time for that measurement
            % It has been assumed that only the MCU and sensor which is
            % being measured are active, all other systemparts(other
            % sensors and communication module) are in Deep Sleep
            T_Processing = 0; % At each new interval the processing time can be different.
            for n=1:1:NoS
                if measurements2(z,n)~=0
                    P_M_MCU = 0;
                    P_M_S(n) = 0;
                    P_DS_rest = sum(P_DS_S(:))-P_DS_S(n)+P_DS_Com;
                    P_M_tot = P_M_MCU + P_M_S(n)+P_DS_rest;
                    T_Processing = T_Processing + S_Sensors(6,n);% (6,n) -> time to process 1 measurement based on 32MHz
                    for tl=0:dt:S_Sensors(5,n)
                        P_Total(t) = P_M_tot;
                        E_Total(t) = E_Total(t-dt) + P_M_tot*dt;
                        tltest(t) = tl;
                        t = t +dt;
                    end
                end
            end
            %% Energy usage during processing stage [_P_]
   
            P_P_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);%(3,1)=V (4,1)=mA/MHz (8,1)=MHz
            P_P_Com = S_Com(3,1)*S_Com(8,1); % Communication module is set in active mode. 
            P_P_tot = P_P_MCU +P_P_Com +sum(P_DS_S(:));
            T_MCU_tot = (T_Processing/32)*S_MCU(8,1) +S_MCU(5,1); % (5,1) is Extra time in active mode. [s]
            for tl=0:dt:T_MCU_tot
                P_Total(t) = P_P_tot;
                E_Total(t) = E_Total(t-dt) + P_P_tot*dt;
                tltest(t) = tl;
                t = t +dt;
            end
            %% Energy usage during transmision stage [_Tr_]
            % is leuk als volgorde en hoeveelheid van Tx en Rx ingegeven
            % kan worden.
            P_Tr_Com = 0;
            P_Tr_MCU = 0;
            
            
            %% Energy usage during shutdown stage [_SD_]
            
            
            
            z=z+1;           
        end
    end
end
disp('Finished calc_totalenergy function');
end