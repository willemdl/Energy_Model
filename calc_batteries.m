function [Results_Batteries] = calc_batteries()
BatteryTable = readtable('Batteries.xlsx');
B = table2struct(BatteryTable,'ToScalar',true);
% B.Voltage = str2double(B.Voltage);
% B.PeakDischarge = str2double(B.PeakDischarge);
% B.NomDischarge = str2double(B.NomDischarge);
% B.Height = str2double(B.Height);
% B.Width = str2double(B.Width);
% B.Length = str2double(B.Length);
% B.Weight = str2double(B.Weight);
% B.Diameter = str2double(B.Diameter);
% B.Energy = str2double(B.Energy);

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



Results_Batteries.Size = Size;
Results_Batteries.Edensity = Edensity; %mWh/cm^3
set(0,'DefaultFigureWindowStyle','docked')  % 'normal' to un-dock
% figure('Name','Size');
% bar(Size);
% title('size');
% set(gca, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',cellstr(B.Name)); 
% 
% figure('Name','Density');
% bar(Edensity);
% title('Edensity');
% set(gca, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',cellstr(B.Name)); 
% 
% figure('Name','Ipeak');
% bar(B.PeakDischarge);
% title('PeakDischarge');
% set(gca, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',cellstr(B.Name)); 

[Sorted_Size, new_indices] = sort(Size); % sorts in *ascending* order
Sorted_labels = string(B.Name(new_indices)); 
Sorted_chem = string(B.Chemistry(new_indices));
Sorted_Voltage = B.Voltage(new_indices);
Sorted_Energy = Energy(new_indices);
Sorted_Edensity = Edensity(new_indices);
Sorted_Pdensitynom = Pdensitynom(new_indices);
Sorted_Pdensitypeak = Pdensitypeak(new_indices);
Sorted_PeakDischarge = B.PeakDischarge(new_indices);
Sorted_NomDischarge = B.NomDischarge(new_indices);
%Sorted_Height = B.Height(new_indices).';
%% Figure Size& Energy Density sorted
figure('Name','Size&E_Density');
x = NoB;
y1 = Sorted_Size.';
y2 = Sorted_Edensity.';
xticklabel = cellstr(Sorted_labels);
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Size and Energy density per battery');
ylabel(AX(1),'Size [cm^3]');
ylabel(AX(2),'Energy density [mWh/cm^3]');
set(AX, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',xticklabel,'fontsize', 16,'FontWeight','bold'); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
set(H2,'FaceColor','#D95319');
AX(1).YColor = '#0072BD';
AX(1).YLim = [0 2.25];
AX(1).LineWidth = 1.5;
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
AX(2).LineWidth = 1.5;
xlim([0.5 x+0.5]);
saveas(gcf,'Images\Batteries_size_Edensity','epsc');
%% Figure Size& Energy capacity sorted
figure('Name','Size&E_Capacity');
y1 = Sorted_Size.';
y2 = Sorted_Energy.';
x = NoB;
xticklabel = Sorted_labels;
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Size and Energy capacity per battery');
ylabel(AX(1),'Size [cm^3]');
ylabel(AX(2),'Energy [mWh]');
set(AX, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',xticklabel,'fontsize', 16,'FontWeight','bold'); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
H2(1).FaceColor = '#D95319';
AX(1).YColor = '#0072BD';
AX(1).YLim = [0 2.25];
AX(1).LineWidth = 1.5;
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
AX(2).LineWidth = 1.5;
xlim([0.5 x+0.5]);
saveas(gcf,'Images\Batteries_size_Energy','epsc');
%% Figure Size&  Power sorted
figure('Name','Size&Power');
y1 = Sorted_Size.';
y2 = [(Sorted_NomDischarge.*Sorted_Voltage)  (Sorted_PeakDischarge.*Sorted_Voltage)];
x = NoB;
xticklabel = Sorted_labels;
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Size and Power per battery');
ylabel(AX(1),'Size [cm^3]');
ylabel(AX(2),'Power [mW]');
set(AX, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',xticklabel,'fontsize', 16,'FontWeight','bold'); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
H2(1).FaceColor = '#D95319';
AX(1).YColor = '#0072BD';
AX(1).YLim = [0 2.25];
AX(1).LineWidth = 1.5;
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
AX(2).LineWidth = 1.5;
legend([H1(1) H2(2) H2(3)], 'Size','Nominal Power','Peak Power');
xlim([0.5 x+0.5]);
saveas(gcf,'Images\Batteries_size_Power','epsc');
%% Figure Size&  Power density sorted 
figure('Name','Size&P_density');
y1 = Sorted_Size.';
y2 = [Sorted_Pdensitynom.' Sorted_Pdensitypeak.'];
x = NoB;
xticklabel = Sorted_labels;
[AX,H1,H2]=plotyy(1:x,[y1 nan(x,1)],1:x,[nan(x,1) y2],@bar,@bar);
linkaxes(AX,'x');
title('Size and Power density per battery');
ylabel(AX(1),'Size [cm^3]');
ylabel(AX(2),'Power density [mW/cm^3]');
set(AX, 'XTick', 1:1:NoB,'XTickLabelRotation',45,'xticklabel',xticklabel,'fontsize', 16,'FontWeight','bold'); 
set(AX, 'XGrid', 'on', 'YGrid', 'on');
set(H1,'FaceColor','#0072BD')
H2(1).FaceColor = '#D95319';
AX(1).YColor = '#0072BD';
AX(1).YLim = [0 2.25];
AX(1).LineWidth = 1.5;
AX(2).YColor = '#D95319';
AX(2).XColor = 'k';
AX(2).LineWidth = 1.5;
legend([H1(1) H2(2) H2(3)], 'Size','Nominal Power Density','Peak Power Density');
xlim([0.5 x+0.5]);
saveas(gcf,'Images\Batteries_size_Pdensity','epsc');
end