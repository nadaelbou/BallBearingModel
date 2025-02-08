%% Bearing Parameters (Geometry & Stiffness)
M_tot = 0.38;      %[kg] 
Nb = 9;            %[-] Number of balls
g = 9.81;          %[m/s^2]
rho = 7800;        %[kg/m^3]

% Geometrical Properties
B = 16e-3; 
D = 62e-3; 
D2 = 54.06e-3;
d1 = 40.36e-3;
d = 30e-3; 

% Outer Ring Properties
E_or2 = 200e9;  %[Pa] Steel alloy
A_vo2 = ((D/2)^2 - (D2/2)^2) / Nb;
L_ov2 = (D - D2) / (2 * Nb);
M_out = rho * A_vo2 * B / Nb;  %[kg]
k_out = (E_or2 * A_vo2) / L_ov2;  %[N/m]

% Inner Ring Properties
E_ir1 = 200e9;  %[Pa] Steel alloy
A_vi1 = ((d1/2)^2 - (d/2)^2) / Nb;
L_iv1 = (d1 - d) / 2;
M_in = rho * A_vi1 * B / Nb;  %[kg]
k_in  = (E_ir1 * A_vi1) / L_iv1;  %[N/m]

%% Rotor Parameters
D_r = d;                 % Shaft diameter [m]
R_r = D_r / 2;           % Shaft radius [m]        
L_r = B;                 % Shaft length [m]
E_r = 200e9;             % Steel alloy [Pa]
A_r = pi * R_r^2;        % Cross-sectional area [m^2]
k_shaft = (E_r * A_r) / L_r;  %[N/m]
k_in = k_in + k_shaft; 

%% Ball Properties
D_ball = (D2 - d1) / 2;             % Ball diameter [m]
M_ball = rho * (4/3) * pi * (D_ball/2)^3;  % Mass [kg]
R_ball = D_ball / 2;              % Radius [m]
E_ball = 200e9;                   % Steel alloy [Pa]
A_ball = pi * (R_ball / 2);        % Cross-sectional area [m^2]
L_ball = D_ball;                   % Length [m]
k_ball  = (E_ball * A_ball) / L_ball;  %[N/m]

%% Hertzian Contact Stiffness

r = 0.9;  % Restitution ratio [-]

kh_i = M_ball / (M_in + M_ball) * k_in * exp((2 * log(r)) / pi * asin(pi / sqrt(pi^2 + log(r)^2)));
kh_o = M_ball / (M_out + M_ball) * k_out * exp((2 * log(r)) / pi * asin(pi / sqrt(pi^2 + log(r)^2)));

%% Damping Constants
ch_in = 1376.8; 
ch_out = 2210.7; 

%% Initial Conditions & Simulation Setup

M2 = M_out; 
M1 = M_in; 
m_shaft = rho * pi * (155e-3) * (45e-3)^2; % Rotor mass computed as rho [kg/m3]*Volume[m3] - to be adjusted according to your data[kg]

F = 200; % [N] Electromagnetic Radial Force - To be determined by the user  

param.m = [M_in; M1; M_ball; M2];
param.k = [k_in; kh_i; kh_o; k_out];
param.c = [0; ch_in; ch_out; 0];
param.khertz = [kh_i; kh_o];
param.chertz = [ch_in; ch_out];
param.shaft = m_shaft;

% Degrees of freedom
ndof = 4;

% Initial Conditions
u0 = zeros(ndof,1);
v0 = zeros(ndof,1);

%% Simulation Parameters

Ts = 1e-7;  
Tend = 0.5;
p = 2; 
fs = 50;    % [Hz] Mechanical Frequency - shaft 
ws = 2 * pi * fs;

%% Bearing Frequencies

BPFI = fs * (Nb/2) * (1 + (D/d));
BPFO = fs * (Nb/2) * (1 - (D/d));
t_BPFO = 1 / BPFO;
t_BPFI = 1 / BPFI;

%% Bearing Health State 

Cdin = 0;       % Depth of the fault in the inner ring [m]
Cdout = 0;      % Depth of the fault in the inner ring [m]
alpha = 0.05;   % Length of the fault [rad]
