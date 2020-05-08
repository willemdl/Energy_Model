close all
clear all

disp('main script');
initsensorstemp;
disp('back to main');
[P_TYP_Measure, E_consumed] = modelsensorstemp(NoS, N_Max, VDD_TYP, IDD_TYP_Measure, IDD_TYP_SHDN, T_conv_TYP);
disp('back to main2');
resultsensorstemp(NoS, N_Max, E_consumed);
disp('back to main3');
disp('test');