function [R_B] = calc_batteries(B)


NoB = size(B.Height,1);%Number of Batteries
Size = zeros(1,NoB); %[cm^3]
Edensity = zeros(1,NoB);
Energy = zeros(1,NoB);
Pdensitypeak = zeros(1,NoB);
Pdensitynom = zeros(1,NoB);

for x=1:1:NoB
    if B.Width(x) == 0
        Size(x) = pi * (B.Diameter(x)/2)^2 * B.Height(x)/1000;
    else
        Size(x) = B.Width(x)*B.Length(x)*B.Height(x)/1000;
    end
    Edensity(x) =  B.Energy(x)*B.Voltage(x)/ Size(x); %[mWh/cm^3]
    Pdensitypeak(x) = B.PeakDischarge(x)*B.Voltage(x)/Size(x); %[mW/cm^3]
    Pdensitynom(x) = B.NomDischarge(x)*B.Voltage(x)/Size(x); %[mW/cm^3]
    Energy(x) = B.Energy(x)*B.Voltage(x);%[mWh]
end



R_B.Size = Size;
R_B.Edensity = Edensity; %mWh/cm^3
R_B.Pdensitypeak = Pdensitypeak;
R_B.Pdensitynom = Pdensitynom;
R_B.Energy = Energy;

end