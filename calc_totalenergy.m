function [P_Total, E_Total, T_Total, measurements3, time, tmeasurement, tltest] = calc_totalenergy(S_Sensors, S_MCU, S_Com, I_Array)
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
T_Total = 3*24*3600;

[~, NoS] = size(S_Sensors); %NoS = Number of Sensors
P_M_S = zeros(NoS); %P_M_ means power during Measurement _S refers to Sensor
P_DS_S = zeros(NoS); %P_S_ means power during Deep Sleep _S refers to Sensor

%dt = .1;%Step size of the time.[s] bare in mind that if dt is too large
%the symulation will not be accurate or fails.
dt_l=0.1;
%dt_l kan ook automatisch gemaakt worden, zoek in alle input parameters
%naar de kleinste tijd(of met meeste decimalen) en baseer daar de stapgrote
%op. 
dt=dt_l;

dt_h=1;
I_dt_h= I_Array(:,1);
%determine max step size: search for smalles unit in the interval
while (mod(I_dt_h(:,1),10)==0)
    I_dt_h = I_dt_h(:)./10;
    dt_h= dt_h*10;
end

%than calculations wil be wrong.
time = zeros(T_Total/dt,1); %vector with the actual time
tmeasurement = zeros(100,1);
k = 1;%this is the index used for vectors and arrays
z=0;%This is used to keep track of how often and when measurement takes place.
% https://matlab.fandom.com/wiki/FAQ#Why_is_0.3_-_0.2_-_0.1_.28or_similar.29_not_equal_to_zero.3F
% https://nl.mathworks.com/matlabcentral/answers/49910-mod-bug-or-something-else

% T_Processing is the total time the MCU spends on processing the measured data.
measurements2 = zeros(100,NoS+2);
P_Total = zeros(T_Total/dt,1);
E_Total = zeros(T_Total/dt,1);
tltest = zeros(T_Total/dt,1);

%% The large loop
for i=1:1:NoS
    P_DS_S(i) = S_Sensors(2,i)*S_Sensors(6,i);%in mW (2,i)=[V] (6,i)=mA
end
P_DS_MCU = S_MCU(3,1)*S_MCU(7,1);%in mW
P_DS_Com = S_Com(3,1)*S_Com(10,1);%in mW

while time(k) < T_Total  %nu alleen gebaseerd op tijd, 2e while of iets voor berekenen tot wanneer energie op is.
    
    %% Energy usage during sleep
    if mod(floor(time(k)),100)==0 %floor rond af naar beneden en zorgt voor integer
        dt=dt_h;
    else
        dt=dt_l;
    end
    k = k+1;
    P_DS_tot = sum(P_DS_S(:))+P_DS_MCU +P_DS_Com;
    P_Total(k) = P_DS_tot;
    E_Total(k) = E_Total(k-1)+P_DS_tot*dt;
    time(k) = time(k-1) +dt;

    %% Energy usage during activities
    %if mod(time(k),1)%this is an easier check than the next if thus should make the matlab script faster
        if any(~mod(floor(time(k)),I_Array(:,1))) %gives true if any interval is true
            z=z+1;
            dt=dt_l;
            measurements = I_Array(find(~mod(floor(time(k)),I_Array(:,1))),2:end);%gives an vector of all
            measurements2(z,:) = sum(measurements,1);
            tmeasurement(z) = time(k);%gives an vector with the times at which the if statement was true,
            %in order to check this easily

            %% Energy usage during wake up stage [_WU_]
            % It has been assumed that only the MCU has an wake up stage,
            % the rest remains in Deep Sleep.
            P_WU_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);
            P_DS_rest = sum(P_DS_S(:)) +P_DS_Com;
            P_WU_tot = P_WU_MCU+ P_DS_rest;
            for tl=0:dt:S_MCU(6,1)
                k = k+1;
                P_Total(k) = P_WU_tot;
                E_Total(k) = E_Total(k-1) +P_WU_tot*dt;
                tltest(k) = tl;
                time(k) = time(k-1) +dt;  
            end
            %% Energy usage measurement stage [_M_]
            % S_Sensors(x,1) x=2 -> voltage x=3-> current during measurement
            % x=5-> time for that measurement
            % It has been assumed that only the MCU and sensor which is
            % being measured are active, all other systemparts(other
            % sensors and communication module) are in Deep Sleep
            T_Processing = 0; % At each new interval the processing time can be different.
            for n=1:1:NoS
                if measurements2(z,n)~=0
                    P_M_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);
                    P_M_S(n) = S_Sensors(2,n)*S_Sensors(3,n);
                    P_DS_rest = sum(P_DS_S(:))-P_DS_S(n)+P_DS_Com;
                    P_M_tot = P_M_MCU + P_M_S(n)+P_DS_rest;
                    T_Processing = T_Processing + S_Sensors(5,n);% (6,n) -> time[s] to process 1 measurement based on 32MHz
                    for tl=0:dt:S_Sensors(4,n) % (5,n) time measuring[s]
                        k = k+1;
                        P_Total(k) = P_M_tot;
                        E_Total(k) = E_Total(k-1) + P_M_tot*dt;
                        tltest(k) = tl;
                        time(k) = time(k-1) +dt;
                    end
                end
            end
            %% Energy usage during processing stage [_P_]
            P_P_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);%(3,1)=V (4,1)=mA/MHz (8,1)=MHz
            P_P_Com = S_Com(3,1)*S_Com(8,1); % Communication module is set in active mode.
            P_P_tot = P_P_MCU +P_P_Com +sum(P_DS_S(:));
            T_MCU_tot = (T_Processing/32)*S_MCU(8,1) +S_MCU(5,1); % (5,1) is Extra time in active mode. [s]
            for tl=0:dt:T_MCU_tot
                k = k+1;
                P_Total(k) = P_P_tot;
                E_Total(k) = E_Total(k-1) + P_P_tot*dt;
                tltest(k) = tl;
                time(k) = time(k-1) +dt;
            end
            %% Energy usage during transmision stage [_Tr_]
            % is leuk als volgorde en hoeveelheid van Tx en Rx ingegeven
            % kan worden.
            P_Tr_Com = 0;
            P_Tr_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);
            %idee: vector maken waarin staat 1) de modus; Tx/Rx of standaard 2) de
            %tijd in die modus
            
            %% Energy usage during shutdown stage [_SD_]
            
            
        end
    %end
end
%truncate vectors and matrices
time = [0 ; nonzeros(time(:))];
measurements3= measurements2( any(measurements2,2), :);%https://nl.mathworks.com/matlabcentral/answers/40018-delete-zeros-rows-and-columns
P_Total = [0 ; P_Total(any(E_Total,2),:)];
E_Total = [0 ; E_Total(any(E_Total,2),:)];
disp('Finished calc_totalenergy function');
end