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

sim("lab6.slx");
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




