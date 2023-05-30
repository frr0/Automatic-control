close all;
clear;
clc;

G = (-7044)/((s - 29.68) * (s + 29.68));

%% Steady-state controller
Kc = 1
C_ss = Kc/s^2;
L1 = G*C_ss; % Loop function update
M_S_LF= -23.5 % dB

%% Transient requirements
T_p = 2.67; % dB
S_p = 4.35; % dB
wc_des = 125; %

Ts = 0.001; % sampling time
G_ZOH = 1/ (1+s*Ts/2); % ZOH tf
L11 = G_ZOH * L1;

%% Loop function tf: L prime
%L1 = G*C_ss; 
figure(1), nichols(L11, 'b'), hold on, T_grid(T_p), S_grid(S_p), S_grid(M_S_LF)
[magnitude_prime, phase_prime] = nichols(L1, wc_des);
magnitude_prime = 20*log(magnitude_prime);
return

% Cd = 

%% ======================

m = .1;
l = .5;
B = .1; % attrito, senza, si muove all'infinito
g = 9.81;

%% = 1 ============
% u_bar = 0;
% theta0 = 0;
% velocity0 = 0;

%% = 2 ============
% u_bar = 0;
% theta0 = pi+.001;
% velocity0 = 0;

%% = 3 ============
u_bar = l*m*g;
theta0 = pi/2 - 1e-2;
velocity0 = 0;

out = sim("a.slx");
plot(out)

save s270874