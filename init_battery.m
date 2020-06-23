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
BatteryTable = readtable('Batteries.xlsx');
Batteries = BatteryClass;
Batteries = table2struct(BatteryTable,'ToScalar',true);

% the following is not needed any more because comma's from excel are
% converted into dots for matlab.
% this function does lack "safety" features such as check if column consists 
% of doubles instead of strings. 

% B.Voltage = str2double(B.Voltage);
% B.PeakDischarge = str2double(B.PeakDischarge);
% B.NomDischarge = str2double(B.NomDischarge);
% B.Height = str2double(B.Height);
% B.Width = str2double(B.Width);
% B.Length = str2double(B.Length);
% B.Weight = str2double(B.Weight);
% B.Diameter = str2double(B.Diameter);
% B.Energy = str2double(B.Energy);
end