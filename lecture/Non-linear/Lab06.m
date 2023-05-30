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



%% ==================================

close all
clear all
clc

s = tf('s');

%Plant tf
G=40/(s^2+4*s-9.81);

%steady state controller
Kc = 2
C_SS = Kc/s
L1 = C_SS*G;
M_T_HF = -20; %dB


%ZOH filter
Ts = 0.02;
G_ZOH = 1/(1+s*Ts/2)
L11 = G_ZOH*L1

%Transient reqs
T_p = 1.7;
S_p = 3.76;
wc_des = 6;

%nichols plot
figure(1)
nichols(L11, 'r');
hold on
T_grid(T_p);
S_grid(S_p);
T_grid(M_T_HF);

%zero design
wnorm = 2.1;
wz = wc_des/wnorm;
C_Z = (1+s/wz)^2;
L2 = C_Z*L11;
C = C_Z*C_SS;
figure(1), hold on
nichols(L2, 'b');

%Gain adjustment
K = 10^(3.5/20);
L3 = L2*K;
C = C*K;
figure(1);
nichols(L3, 'k');

wp = 60;
C_P = 1/(1+s/wp);
L4 = L3*C_P;
C = C*C_P;
figure(1);
nichols(L4, 'm');

%controller discret
Cd = c2d(C, Ts, 'tustin');

%sim
t_stop = 25;
rho = 1;
delta_a = 0;
delta_y = 0;
delta_t = 0;
w_y = 90;

sim("digital_controller_sim_jul.slx");
figure
plot(y.time, y.data, 'r','LineWidth',1.5)
hold on
grid on
plot(r.time, r.data, ':k','LineWidth',1.5)
xlabel('time (s)')
ylabel('y')


figure
plot(u.time, 0.2*u.data, 'b','LineWidth',1.5)
xlabel('time (s)')
ylabel('u')
grid on
zoom on

figure
plot(e.time, e.data, 'g','LineWidth',1.5)
xlabel('time (s)')
ylabel('e')
grid on
zoom on

%% ================================

clc
close all
clear all

s = tf('s');

%plant tf
G = 10/(s*(s+5)*(s+10))

%steady state controller
Kc = 5;
C_SS = Kc;
L1 = C_SS*G;

%transient req
T_p = 0.34;
S_p = 2.54;
wc_des = 6;

%nichols plot
figure(1)
nichols(L1, 'b');
hold on
T_grid(T_p);
S_grid(S_p);

%real zero
wnorm = 1.5;
wz = wc_des/wnorm;
C_Z = (1+s/wz);
L2 = C_Z*L1;
C = C_Z*C_SS;
figure(1), hold on
nichols(L2, 'r');

%lag
% mI = 10^(-15/20);
% alpha = 10;
% wI = wc_des/(alpha*mI);
% C_I = (1+s/(mI*wI))/(1+s/wI);
% L3 = L2*C_I;
% C = C*C_I;
% figure(1);
% nichols(L3, 'k');

%Gain adjustment
K = 10^(15/20);
L3 = L2*K;
C = C*K;
figure(1);
nichols(L3, 'k');

%closure pole design
wp = 60;
C_P = 1/(1+s/wp);
L4 = L3*C_P;
C = C*C_P;
figure(1);
nichols(L4, 'm');

%simulation
t_stop = 10;
rho = 1;
delta_a = 0;
delta_y = 0;
delta_t = 0;
w_y = 0;

sim("leadnet_example1_sim.slx");
figure
plot(y.time, y.data, 'r','LineWidth',1.5)
hold on
grid on
plot(r.time, r.data, ':k','LineWidth',1.5)
xlabel('time (s)')
ylabel('y')

figure
plot(u.time, u.data, 'b','LineWidth',1.5)
xlabel('time (s)')
ylabel('u')
grid on
zoom on

figure
plot(e.time, e.data, 'g','LineWidth',1.5)
xlabel('time (s)')
ylabel('e')
grid on
zoom on






