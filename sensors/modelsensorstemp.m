function [P_TYP_Measure, E_consumed] = modelsensorstemp(NoS, N_Max, VDD_TYP, IDD_TYP_Measure, IDD_TYP_SHDN, T_conv_TYP)
disp('modelsensorstemp.m');
%% Power calculations
%Calculating the amount of power consumed per sensor when measuring and
%when in 'shut down' mode.
P_TYP_Measure = zeros(1, NoS);
P_TYP_SHDN = zeros(1, NoS);

for i = 1:NoS
    P_TYP_Measure(i) = VDD_TYP(i) * IDD_TYP_Measure(i);
    P_TYP_SHDN(i) = VDD_TYP(i) * IDD_TYP_SHDN(i);
end

%% Energy calculations
%Calculating the amount of energy per sensor needed per hour to do an amount of
%measurements per hour.
E_consumed = zeros(NoS, N_Max);
for i = 1:NoS
    for N = 1:N_Max
       E_consumed(i,N) = P_TYP_Measure(i)*T_conv_TYP(i)*N + P_TYP_SHDN(i)*(3600 - T_conv_TYP(i)*N);
    end    
end
end
