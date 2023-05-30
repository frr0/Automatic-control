close all;
clear;
clc;

s = tf('s');

%% Plant tf
G = 0.5/(1 + 4*s);

%% Steady-state controller
Kc = 1
C_ss = Kc/s^2;
L1 = G*C_ss; % Loop function update
M_S_LF= -30 % dB

%% Transient requirements
T_p = 0.42; % dB
S_p = 2.67; % dB
wc_des = 1.5; %

	


%% lead network design
%mD = 12 % ????
w_norm = 4; %5 trovato da grafico 2/2 2 60 in da 1.8 out
wZ = wc_des/w_norm
C_Z = (1+(s/wZ))^2;


%% Update loop function tf: L second
L2 = L1 * C_Z;
figure(1), nichols(L2, 'r');
[magnitude_second, phase_second] = nichols(L2, wc_des);
magnitude_second = 20*log(magnitude_second);


%gain adjustament

k = 10^(-8/20);
L3=L2*k;
C = C_Z*k
figure(1), nichols(L3, 'g')


w_p = 6;
C_p = (1+(s/w_p));
L4=L3*C_p; % ??
C = C_Z*k %??
figure(1), nichols(L4, 'b')
return 

%% Update Control function tf
C = C_ss*C_Z;

%% lag network

mI = 10 ^ (0/20);
alpha = 10;

%% step info
% S = stepinfo(out.y.data, out.y.time, 'RiseTimeLimits', [0 1],  'SettlingTimeThreshold', 0.05)
% return
%% Simulation parameters
t_stop = 10; % simulation time
rho = .25;
delta_d_y = 0;
delta_d_a = 0;


%% Simulation
out = sim("prova.slx");

plot(out)
plot(out.y.Time, out.y.Data, 'k', 'LineWidth', 2), grid on, title("step response y(t)");
y_step_response = stepinfo(out.y.Data, out.y.Time, 'SettlingTimeThreshold', 0.02, 'RiseTimeThreshold',[0 1])

%% step info
S = stepinfo(out.y.data, out.y.time, 'RiseTimeLimits', [0 1],  'SettlingTimeThreshold', 0.05)
% return

save s270874

