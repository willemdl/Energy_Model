function [Results_Batteries] = calc_batteries()
BatteryTable = readtable('Batteries.xlsx');
B = table2struct(BatteryTable,'ToScalar',true);
B.Voltage = str2double(B.Voltage);
B.Height = str2double(B.Height);
B.Width = str2double(B.Width);
B.Length = str2double(B.Length);
B.Weight = str2double(B.Weight);
B.Diameter = str2double(B.Diameter);
B.Energy = str2double(B.Energy);

NoB = size(B.Height,1);%Number of Batteries
Size = zeros(1,NoB); %[cm^3]
Edensity = zeros(1,NoB);
Energy = zeros(1,NoB);

for x=1:1:NoB
    if B.Width(x) == 0
        Size(x) = pi * (B.Diameter(x)/2)^2 * B.Height(x)/1000;
    else
        Size(x) = B.Width(x)*B.Length(x)*B.Height(x)/1000;
    end
    Edensity(x) =  B.Energy(x)*B.Voltage(x)/ Size(x); %[Wh/cm^3]
    Energy(x) = B.Energy(x)*B.Voltage(x);%[Wh]
end



Results_Batteries.Size = Size;
Results_Batteries.Edensity = Edensity; %J/cm^3
set(0,'DefaultFigureWindowStyle','docked')  % 'normal' to un-dock
figure('Name','Size');
bar(Size);
title('size');
set(gca, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',cellstr(B.Name)); 

figure('Name','Density');
bar(Edensity);
title('Edensity');
set(gca, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',cellstr(B.Name)); 

figure('Name','Ipeak');
bar(B.PeakDischarge);
title('PeakDischarge');
set(gca, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',cellstr(B.Name)); 


figure('Name','Size&Density');
y1 = Size.';
y2 = [Edensity.'];
x = NoB;
xticklabel = cellstr(B.Name);
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Size and Energy density per battery');
ylabel(AX(1),'Size [cm^3]');
ylabel(AX(2),'Edensity [mWh/cm^3]');
set(AX, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',xticklabel); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319');
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 x+0.5]);

[Sorted_Size, new_indices] = sort(Size); % sorts in *ascending* order
Sorted_labels = B.Name(new_indices); 
Sorted_chem = B.Chemistry(new_indices);
Sorted_Energy = Energy(new_indices);
figure('Name','Size&Capacity');
y1 = Sorted_Size.';
y2 = Sorted_Energy.';
x = NoB;
xticklabel = [{string(Sorted_labels.')} ;{string(Sorted_chem.')}];
%tickLabels = strtrim(sprintf('%s\\newline%s\\newline%s\n', xticklabel{:}));
test5 = string(Sorted_labels) + newline + string(Sorted_chem);
tickLabels = {test5};
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Size and Energy capacity per battery');
ylabel(AX(1),'Size [cm^3]');
ylabel(AX(2),'Energy [mWh]');
set(AX, 'XTick', 1:1:NoB,'XTickLabelRotation',0,'xticklabel',tickLabels); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
H2(1).FaceColor = '#D95319';
AX(1).YColor = '#0072BD';
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
xlim([0.5 x+0.5]);

end