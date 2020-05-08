disp('initsensorstemp.m');
%% Simulation parameters
NoS = 6;                        % Number of sensors used for simulation 
N_Max = 20;                     % Maximum number of measurements per hour (Minimum number of measurements per hour is 1)

%% Temperature Sensor parameters
%currently the following parameters exist per temperature sensor;
%VDD_TYP(i)          % Supply voltage (V)
%IDD_TYP_Measure(i)  % Current draw of sensor during measurements (A)
%IDD_TYP_SHDN(i)     % Current draw of sensor during shut down (A)
%T_conv_TYP(i)       % Active  conversion time (s)

% TMP117
VDD_TYP(1) = 3.3;                   % Supply voltage (V)
IDD_TYP_Measure(1) = 135*10E-6;     % Current draw of sensor during measurements (A)
IDD_TYP_SHDN(1) = 0.15*10E-6;       % Current draw of sensor during shut down (A)
T_conv_TYP(1) = 15.5*10E-3;         % Active  conversion time (s)

% Si7051
VDD_TYP(2) = 2.8;                   % Supply voltage (V)
IDD_TYP_Measure(2) = 90*10E-6;      % Current draw of sensor during measurements (A)
IDD_TYP_SHDN(2) = 0.06*10E-6;       % Current draw of sensor during shut down (Stand by state for Si7051) (A)
T_conv_TYP(2) = 7*10E-3;            % Active  conversion time (s)

% AS6212
VDD_TYP(3) = 3;                             % Supply voltage (V)
IDD_TYP_Measure(3) = 40*10E-6;              % Current draw of sensor during measurements (A)
IDD_TYP_Standby(3) = 0.1*10E-6;             % Current draw of sensor during standby (A)
IDD_TYP_SHDN(3) = 0.5*IDD_TYP_Standby(3);   % Current draw of sensor during shut down (A) 
                                            % (datasheet doensn't give value only
                                            % says power consumption is reduced to
                                            % minimum, we will use 0.5*IDD_TYP_Standby)
T_conv_TYP(3) = 36*10E-3;                   % Active  conversion time (s)

% MCP9808
VDD_TYP(4) = 3.3;                   % Supply voltage (V)
IDD_TYP_Measure(4) = 200*10E-6;     % Current draw of sensor during measurements (A)
IDD_TYP_SHDN(4) = 0.1*10E-6;        % Current draw of sensor during shut down (A)
T_conv_TYP(4) = 250*10E-3;          % Active  conversion time (s)

% MAX30208
VDD_TYP(5) = 1.8;                   % Supply voltage (V)
IDD_TYP_Measure(5) = 67*10E-6;      % Current draw of sensor during measurements (A)
IDD_TYP_SHDN(5) = 0.5*10E-6;        % Current draw of sensor during shut down (A)
T_conv_TYP(5) = 15*10E-3;           % Active  conversion time (s)

% MAX44006 (only temp, not color sensor)
VDD_TYP(6) = 1.8;                   % Supply voltage (V)
IDD_TYP_Measure(6) = 10*10E-6;      % Current draw of sensor during measurements (A)
IDD_TYP_SHDN(6) = 0.01*10E-6;        % Current draw of sensor during shut down (A)
T_conv_TYP(6) = 400*10E-3;           % Active  conversion time (s)