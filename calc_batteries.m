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

R_B.Brand = B.Brand;
R_B.Name = B.Name;
R_B.Chemistry = B.Chemistry;
R_B.Height = B.Height;
R_B.Width = B.Width;
R_B.Length = B.Length;
R_B.Diameter = B.Diameter;
R_B.Weight = B.Weight;
R_B.Energy = Energy;
R_B.NomDischarge = B.NomDischarge;
R_B.PeakDischarge = B.PeakDischarge;
R_B.Voltage = B.Voltage;
R_B.Size = Size;
R_B.Edensity = Edensity; %mWh/cm^3
R_B.Pdensitypeak = Pdensitypeak;
R_B.Pdensitynom = Pdensitynom;


end