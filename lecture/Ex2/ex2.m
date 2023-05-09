close all;
clear;
clc;

s = tf('s');

%% Plant tf
G = 0.045/(s^2 + 2.6*s + 1.2);

%% Steady-state controller
Kc = 34
C_ss = 34/s;
L1 = G*C_ss; % Loop function update

%% Transient requirements
T_p = 0.40; % dB
S_p = 2.67; % dB
wc_des = 1; %

%% Loop function tf: L prime
%L1 = G*C_ss;
% figure(1), nichols(L1, 'b'), hold on, T_grid(T_p), S_grid(S_p)
[magnitude_prime, phase_prime] = nichols(L1, wc_des);
magnitude_prime = 20*log(magnitude_prime);


%% lead network design
%mD = 12 % ????
w_norm = 1.8; % trovato da grafico 2/2 2 60 in da 1.8 out
wZ = wc_des/w_norm
C_Z = (1+s/wZ);

%% Update loop function tf: L second
L2 = L1 * C_Z;
% figure(1), nichols(L2, 'r');
[magnitude_second, phase_second] = nichols(L2, wc_des);
magnitude_second = 20*log(magnitude_second);

%% Update Control function tf
C = C_ss*C_Z;

%% lag network

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
y_step_response = stepinfo(out.y.Data, out.y.Time, 'SettlingTimeThreshold', 0.01, 'RiseTimeThreshold',[0 1])

%% step info
S = stepinfo(out.y.data, out.y.time, 'RiseTimeLimits', [0 1],  'SettlingTimeThreshold', 0.05)
% return

save s270874

