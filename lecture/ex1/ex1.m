close all;
clear;
clc;

s = tf('s');

%% Plant tf
G = 0.5/(s*(1+s));

%% Steady-state controller
Kc = 5
C_ss = Kc/s;
C_ss = 20;

%% Transient requirements
T_p = 3.40; % dB
S_p = 4.91; % dB
wc_des = 6.5;

%% Loop function tf: L prime
L1 = G*C_ss;
figure(1), nichols(L1, 'b'), hold on, T_grid(T_p), S_grid(S_p)
[magnitude_prime, phase_prime] = nichols(L1, wc_des);
magnitude_prime = 20*log(magnitude_prime);

%% lead network design
mD = 12
w_norm = 3;
wD = wc_des/w_norm
C_D = (1+s/wD)/(1+s/(mD*wD));

%% Update loop function tf: L second
L2 = L1 * C_D;
figure(1), nichols(L2, 'r');
[magnitude_second, phase_second] = nichols(L2, wc_des);
magnitude_second = 20*log(magnitude_second);

%% Update Control function tf
C = C_ss*C_D;

%% lag network



%% Simulation parameters
t_stop = 3;
rho = 1;
delta_d_y = 0;
delta_d_a = 0;

%% Simulation
out = sim("mymodel.slx");

figure(), plot(out.y.Time, out.y.Data, 'k', 'LineWidth', 2), grid on, title("step response y(t)");
y_step_response = stepinfo(out.y.Data, out.y.Time, 'SettlingTimeThreshold', 0.01, 'RiseTimeThreshold',[0 1])

