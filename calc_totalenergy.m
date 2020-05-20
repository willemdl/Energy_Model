function [ P_Sub, E_Sub, measurements3, time, tmeasurement, tltest] = calc_totalenergy(S_Sensors, S_MCU, S_Com, I_Array, T_Max, E_Max)
disp('Started calc_totalenergy function');
%input; one array with the sensors that will be used,
%one vector with MCU parameters, one vector with transmission parameters.
%One array with the

%output; 2 vectors/arrays 1 with energy in mili Joule [mJ] and one with the time. seperate time
%vectors will be outputed in order to easily plot and use the energy data.
%energy array; each column is one energy calculation and each row is the
%amount of energy at each time. colums; [allSensors MCU Communication Total Stagenumber]

%% General information about this function
% The values for power variables are in mW and thus energy is in mJ
% additionally the time is in seconds
% The following assumptions have been made: 1) The time between 2
% intervals is larger than it takes to perform actions required for 1
% interval. 2) The MCU is active while measurements with sensors are
% performed.

%% initialisation of function specific variables
[~, NoS] = size(S_Sensors); %NoS = Number of Sensors
P_M_S = zeros(NoS); %P_M_ means power during Measurement _S refers to Sensor
P_DS_S = zeros(1,NoS); %P_S_ means power during Deep Sleep _S refers to Sensor


%determine max step size when device is in deep sleep; search for smalles unit in the interval
I_Step_Max= I_Array(:,1);
Step_Max = 1;
while (mod(I_Step_Max(:,1),10)==0)
    I_Step_Max = I_Step_Max(:)./10;
    Step_Max= Step_Max*10; %dt_h is the maximum stepsize
end

dt=0.1; %used for initialisation of matrices and vectors
time = zeros(T_Max/dt,1); %vector with the actual time
tmeasurement = zeros(100,2); %array each row contains in column 1 start time of measurement and 2nd the finished time
k = 1;%this is the index used for vectors and arrays
z=0;%This is used to keep track of how often and when measurement takes place.
% https://matlab.fandom.com/wiki/FAQ#Why_is_0.3_-_0.2_-_0.1_.28or_similar.29_not_equal_to_zero.3F
% https://nl.mathworks.com/matlabcentral/answers/49910-mod-bug-or-something-else

% T_Processing is the total time the MCU spends on processing the measured data.
measurements2 = zeros(100,NoS+2);
P_Sub = zeros(T_Max/dt, NoS+4);%--- uitleggen hoe werkt en noemen dat Ptot pas aan einde word berekend/toegevoegd.
E_Tot = zeros(T_Max/dt, 1);

%tltest = zeros(T_Max/dt,1);
tltest=0;
%% The large loop
for i=1:1:NoS
    P_DS_S(1,i) = S_Sensors(4,i)*S_Sensors(8,i);%in mW (2,i)=[V] (6,i)=mA
end
P_DS_MCU = S_MCU(3,1)*S_MCU(7,1);%in mW
P_DS_Com = S_Com(3,1)*S_Com(10,1);%in mW

while time(k) < T_Max || E_Tot(k) <= E_Max %nu alleen gebaseerd op tijd, 2e while of iets voor berekenen tot wanneer energie op is.
    
    %------------- "ik doe deze meting en daarvoor had ik x lang in
    %standbay kunnen staan"
    %------------- code opruimen en netter inrichten.
    %------------- dt_vec maken, en dat dan tijd vector aan het einde word
    %berekend?
    %------------- alle vermogens berekeningen buiten de while loop halen
    %------------- significants word nu heel vaak aangeroepen, eventueel
    %ook buiten de loop halen? vectors/variabelen dt_M_mcu ofzo?
    %% Energy usage during sleep
    k = k+1;
    P_Sub(k,1:NoS) = P_DS_S(:);
    P_Sub(k,NoS+1:NoS+2) = [P_DS_MCU P_DS_Com];
    P_Sub(k,NoS+4) = 1;
    E_Tot(k) = E_Tot(k-1)+sum(P_Sub(k,1:NoS+2))*dt;
    time(k) = time(k-1) +dt;
    if mod(floor(time(k)),Step_Max)==0 %floor rond af naar beneden en zorgt voor integer
        %use biggest stepsize possible
        dt=Step_Max;
    elseif Step_Max >=100 && mod(floor(time(k)), 10 )==0 %
        dt= 10;
    elseif Step_Max >=10 && mod(floor(time(k)), 1)==0
        dt= 1;
    else
        dt = 1;
    end
    
    %% Energy usage during activities
    if any(~mod(floor(time(k)),I_Array(:,1))) %gives true if any interval is true
        z=z+1;
        measurements = I_Array(~mod(floor(time(k)),I_Array(:,1)),2:end);%gives an matrix of all measurements that need to be done.
        measurements2(z,:) = sum(measurements,1);
        tmeasurement(z,1) = time(k);%saves the times at which the if statement was true, and thus the measurement started
        %in order to check this easily
        
        
        
        %% Energy usage during wake up stage [_WU_]
        % It has been assumed that only the MCU has an wake up stage,
        % the rest remains in Deep Sleep.
        P_WU_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);
        dt = significants(S_MCU(6,1));
        for tl=0:dt:S_MCU(6,1)
            %tltest(k) = tl;
            
            k = k+1;
            P_Sub(k,1:NoS) = P_DS_S(:); %all sensors in DS
            P_Sub(k,NoS+1:NoS+2) = [P_WU_MCU P_DS_Com];
            P_Sub(k,NoS+4) = 2;
            E_Tot(k) = E_Tot(k-1)+sum(P_Sub(k,1:NoS+2))*dt;
            time(k) = time(k-1) +dt;
        end
        %% Energy usage measurement stage [_M_]
        % S_Sensors(x,1) x=2 -> voltage x=3-> current during measurement
        % x=5-> time for that measurement
        % It has been assumed that only the MCU and sensor which is
        % being measured are active, all other systemparts(other
        % sensors and communication module) are in Deep Sleep
        % Additionally each sensor is after the other activated, thus not 2
        % at the same time.
        T_Processing = 0; % At each new interval the processing time can be different.
        for n=1:1:NoS %for each sensor
            if measurements2(z,n)~=0 %if that sensor needs to be activated
                P_M_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);
                P_M_Com = P_DS_Com; %communication module is still in DS
                T_Processing = T_Processing + S_Sensors(5,n);% (5,n) -> time[s] to process 1 measurement based on 32MHz
                
                dt = significants(S_Sensors(4,n));
                for tl=0:dt:S_Sensors(4,n) % (4,n) time measuring[s]
                    %tltest(k) = tl;
                    k = k+1;
                    P_Sub(k,1:NoS) = P_DS_S(:); %all sensors in DS
                    P_Sub(k,n) = S_Sensors(2,n)*S_Sensors(3,n); %change the one that has been activated
                    P_Sub(k,NoS+1:NoS+2) = [P_M_MCU P_M_Com]; %Communication module is still in DS
                    P_Sub(k,NoS+4) = 3;
                    E_Tot(k) = E_Tot(k-1)+sum(P_Sub(k,1:NoS+2))*dt;
                    time(k) = time(k-1) +dt;
                end
            end
        end
        %% Energy usage during processing stage [_P_]
        P_P_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);%(3,1)=V (4,1)=mA/MHz (8,1)=MHz
        P_P_Com = S_Com(3,1)*S_Com(8,1); % Communication module is set in active mode.
        T_MCU_Tot = (T_Processing/32)*S_MCU(8,1) +S_MCU(5,1); % (5,1) is Extra time in active mode. [s]
        
        dt = significants(T_MCU_Tot);
        for tl=0:dt:T_MCU_Tot
            k = k+1;
            P_Sub(k,1:NoS) = P_DS_S(:); %all sensors in DS during processing stage.
            P_Sub(k,NoS+1:NoS+2) = [P_P_MCU P_P_Com]; %Communication module is still in DS
            P_Sub(k,NoS+4) = 4;
            E_Tot(k) = E_Tot(k-1)+sum(P_Sub(k,1:NoS+2))*dt;
            time(k) = time(k-1) +dt;
            %tltest(k) = tl;
        end
        %% Energy usage during transmision stage [_Tr_]
        % is leuk als volgorde en hoeveelheid van Tx en Rx ingegeven
        % kan worden.
        P_Tr_Com = [S_Com(3,1)*S_Com(8,1) S_Com(3,1)*S_Com(4,1) S_Com(3,1)*S_Com(6,1)];%v*mA power in "standard operation", TX,RX
        T_Tr_Com = [S_Com(9,1) S_Com(5,1) S_Com(7,1)];
        P_Tr_MCU = S_MCU(3,1)*S_MCU(4,1)*S_MCU(8,1);
        volgorde = [1 2 3 2];% 1= standard, 2= tx, 3=rx
        %idee: vector maken waarin staat 1) de modus; Tx/Rx of standaard 2) de
        %tijd in die modus
        for i=1:1:size(volgorde,2)
            mode = volgorde(i);
            dt = significants(T_Tr_Com(mode));
            for tl=0:dt:T_Tr_Com(mode)
                k = k+1;
                P_Sub(k,1:NoS) = P_DS_S(:); %all sensors in DS during transmission stage.
                P_Sub(k,NoS+1:NoS+2) = [P_Tr_MCU P_Tr_Com(mode)];
                P_Sub(k,NoS+4) = 5 + 0.1*volgorde(i);
                E_Tot(k) = E_Tot(k-1)+sum(P_Sub(k,1:NoS+2))*dt;
                time(k) = time(k-1) +dt;
                %tltest(k) = tl;
            end
        end
        
        
        %% Energy usage during shutdown stage [_SD_]
        
        tmeasurement(z,2) = time(k);%saves the times at which the measurement is finished, and thus the measurement started
    end
end
%truncate vectors and matrices
P_Sub(:,NoS+3) = sum(P_Sub(:,1:NoS+2),2); %sum horizontally to derive total power drawn

time = [0 ; nonzeros(time(:))];
measurements3= measurements2( any(measurements2,2), :);%https://nl.mathworks.com/matlabcentral/answers/40018-delete-zeros-rows-and-columns
P_Sub = [zeros(1,NoS+4); P_Sub(any(P_Sub,2),:)]; %truncate P_Sub
E_Sub = [zeros(1,NoS+4) ; cumsum(P_Sub(2:end,1:end-1).*diff(time)) P_Sub(2:end,NoS+4)];
% E_Sub = zeros(max(size(P_Sub)),NoS+4); %initialize E_Sub with zeros
% for k=2:1:max(size(P_Sub))
%     E_Sub(k,1:NoS+3) = E_Sub(k-1,1:NoS+3) + P_Sub(k,1:NoS+3)*(time(k)-time(k-1));
% end
%E_Sub(:,NoS+4) = P_Sub(:,NoS+4); %copy the stage indicator from P_Sub to E_Sub

disp('Finished calc_totalenergy function');
end