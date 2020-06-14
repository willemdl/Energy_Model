function [Batteries] = init_battery()
% 
%         Name
%         Chemistry
%         Height [mm]
%         Width [mm]
%         Diameter [mm]
%         Energy %in mAh
%         Voltage [V]
%         Link [www]

x = 1; 
BatteryBrand(x) = "Varta";
BatteryName(x) = "CP 7840 A3";
BatteryChemistry(x) = "LiNixMnyCozO2";
BatteryLink(x) = "https://www.varta-microbattery.com/fileadmin/varta_microbattery/downloads/products/lithium-ion/Sales-Literature-HANDBOOK_CoinPower_en.pdf";
BatteryHeight(x) = 4.0 ; %[mm]
BatteryWidth(x) = 0; %[mm]
BatteryDiameter(x) = 7.8; %[mm]
BatteryWeight(x) = 0.7; %[g]
BatteryEnergy(x) = 16; %[mAh]
BatteryNomDischarge(x) = 16; %[mA]
BatteryPeakDischarge(x) = 32; %[mA] for at least 1second
BatteryVoltage(x) = 3.7; %[V]



x = x+1; 
BatteryBrand(x) = "Varta";
BatteryName(x) = "CP 0854 A3";
BatteryChemistry(x) = "LiNixMnyCozO2";
BatteryLink(x) = "";
BatteryHeight(x) = 5.4; %[mm]
BatteryWidth(x) = 0; %[mm]
BatteryDiameter(x) = 8.4; %[mm]
BatteryWeight(x) = 0.9; %[g]
BatteryEnergy(x) = 25; %[mAh]
BatteryNomDischarge(x) = 25; %[mA]
BatteryPeakDischarge(x) = 50; %[mA] for at least 1second
BatteryVoltage(x) = 3.7; %[V]


x = x+1; 
BatteryBrand(x) = "Varta";
BatteryName(x) = "CP 9440 A3";
BatteryChemistry(x) = "LiNixMnyCozO2";
BatteryLink(x) = "";
BatteryHeight(x) = 4.0; %[mm]
BatteryWidth(x) = 0; %[mm]
BatteryDiameter(x) = 9.4; %[mm]
BatteryWeight(x) = 0.8; %[g]
BatteryEnergy(x) = 25; %[mAh]
BatteryNomDischarge(x) = 25; %[mA]
BatteryPeakDischarge(x) = 50; %[mA] for at least 1second
BatteryVoltage(x) = 3.7; %[V]




Batteries = BatteryClass;
Batteries.Brand = BatteryBrand;
Batteries.Name = BatteryName;
Batteries.Chemistry = BatteryChemistry;
Batteries.Height = BatteryHeight;
Batteries.Width = BatteryWidth;
Batteries.Diameter = BatteryDiameter;
Batteries.Weight = BatteryWeight;
Batteries.Energy = BatteryEnergy;
Batteries.NomDischarge = BatteryNomDischarge;
Batteries.PeakDischarge = BatteryPeakDischarge; 
Batteries.Voltage = BatteryVoltage;
Batteries.Link = BatteryLink;

end