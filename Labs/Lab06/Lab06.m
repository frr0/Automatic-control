close all;
clear;
clc;

s = tf('s');

G = (1.4 * 10^9)/(s^2*(s + 4.4 * 10^4));

delta_d_y = 0.5;
delta_d_a = 0;
d_a = delta_d_a;
% d_y = delta_d_y * sin(1 * t);

% la funzione ha poli in zero è da è step, quindi non servono altri poli,
% va bene Gc = 0 h = 0
% k_0 = k_c

%% Steady-state controller
K_G = dcgain(G);
K_C = 16; %K_g/K_G; calcolato come da foto cell 17/05
C_ss = K_C;

%L1 = G * C_ss;
M_S_LF = mag2db(0.01/0.5); % dB
zeta = 0.52; % dal primo grafico con S = 16%

%% Transient requirements
T_p = mag2db(1.13); % dB
S_p = mag2db(1.43); % dB
wc_des = 3000; %


%% Loop function tf: L prime
L1 = G*C_ss;
figure(1), nichols(L1, 'b'), hold on, T_grid(T_p), S_grid(S_p), S_grid(M_S_LF)

w_norm = 5;
w_z = wc_des/w_norm; % trovata con (wc/wz) = 3 poi 6, poi 5
C_z = (1+(s/w_z))^2; % real negative zero
L2 = L1*C_z;
figure(1), nichols(L2, 'g'), hold on, T_grid(T_p), S_grid(S_p), S_grid(M_S_LF)

m_i = db2mag(3.34);
w_i = m_i *10;
C_i = (1+s/(m_i * w_i))/(1 + s/w_i); % mag attenuation

L3 = L2*C_i;
figure(1), nichols(L3, 'm'), hold on, T_grid(T_p), S_grid(S_p), S_grid(M_S_LF)

w_p = 4000;
C_p = (1/(1+s/w_p)); % closure pole
L4 = L3*C_p;
figure(1), nichols(L4, 'y'), hold on, T_grid(T_p), S_grid(S_p), S_grid(M_S_LF)

%% simulation

t_stop = 10; % simulation time
r = 1;
% delta_d_y = 0;
% delta_d_a = 0;
C = (1/C_p) * C_i * C_z; % final controller 

%% Simulation

out = sim("lab6.slx");
plot(out)

plot(out.y.Time, out.y.Data, 'k', 'LineWidth', 2), grid on, title("step response y(t)");
y_step_response = stepinfo(out.y.Data, out.y.Time, 'SettlingTimeThreshold', 0.02, 'RiseTimeThreshold',[0 1])

%% step info
stepinfo(L4)
S = stepinfo(out.y.data, out.y.time, 'RiseTimeLimits', [0 1],  'SettlingTimeThreshold', 0.05)

save s270874