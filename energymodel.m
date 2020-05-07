close all
clear all
%% parameters

%energie toevoer toevoegen
%batterij verlies ongeacht wat er van batterij word gevraagd of toegevoegd
%efficientie batterij controller toevoegen
Ptransmit = 10; %in mw
Ttransmit = 10; %in seconds

Psleep = 0.01; %in mw
Tsleep = 0; %in seconds, not used

Psensors = 3; %in mw
Tsensors = 10; %in seconds

Pmc = 1;
Tmc = 5;

Pwakeup = 0.5;
Twakeup = 5;

Nmeasurements = 5; %total number of measurements performed during Ttotaal
Ttotaal = 24*60*60; %in seconds

Vbattery = 0;%
Ahbattery = 0;%
Ebattery = 0;%
dischargerate = 0;%
DoD = 40;%Depth of Discharge in %

%% calculations
versions= 3; %number of versions, used for simulation using different values for a parameter
Eused = zeros(Ttotaal, versions); %in mJ
for v=1:1:versions
    if v ==1 %put under each statement the parameter which needs to be changed.
        Psleep = 0.01;
    elseif v==2
        Psleep = 0.02;
    elseif v==3
        Psleep = 0.03;
    end
    t = 1;
    Tbetween = (Ttotaal - Nmeasurements*(Twakeup+Ttransmit+Tsensors+Tmc))/Nmeasurements;
    for n=1:1:Nmeasurements
        while t<=2
            Eused(t,v) = 0;
            t= t+1;
        end
        
        for i=0:1:Twakeup
            Eused(t,v) = Eused(t-1,v) +Pwakeup;
            t = t+1;
        end
        
        for i=0:1:Tsensors
            Eused(t,v) = Eused(t-1,v) +Psensors;
            t = t+1;
        end
        
        for i=0:1:Tmc
            Eused(t,v) = Eused(t-1,v) +Pmc;
            t = t+1;
        end
        
        for i=0:1:Ttransmit
            Eused(t,v) = Eused(t-1,v) +Ptransmit;
            t = t+1;
        end
        
        while t<n*Tbetween
            Eused(t,v) = Eused(t-1,v) +Psleep;
            t = t+1;
        end
    end
    
end
%% visualisation

time = linspace(0, Ttotaal, Ttotaal);
plot(time/3600, Eused/1000);
xlabel('time [h]');
ylabel('energy consumed [J]');
legend('version 1', 'version 2', 'version 3');
hold on

