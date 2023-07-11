close all
clear all
clc

s = tf('s');
z = tf('z', 0.02);

%Plant tf
G=40/(s^2+4*s-9.81);
zpk(G)


%% steady state controller
K_G = dcgain(G) % k_G = -4
Kc = 2;
K_g = Kc * K_G;
C_SS = Kc/s;
L1 = C_SS * G;
M_T_HF = mag2db(0.01/0.1);

pole(L1)
pole(G)

% figure, nyquist(L1)

%% ZOH filter
Ts = 0.02;
G_ZOH = 1/(1+s*Ts/2)
L11 = G_ZOH*L1

%% transient 
T_p =  mag2db(1.22);
S_p = mag2db(1.53);
wc_des = 6.2;

%nichols plot
figure(1)
nichols(L11, 'r');
hold on
T_grid(T_p);
S_grid(S_p);
T_grid(M_T_HF);


%% zero design

wnorm = 1.8;
wz = wc_des/wnorm;
C_Z = (1+s/wz)^2;
L2 = C_Z*L11;
C = C_Z*C_SS;
figure(1), hold on
nichols(L2, 'b');

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
% plot(y.time, y.data, 'r','LineWidth',1.5)
hold on
grid on
% plot(r.time, r.data, ':k','LineWidth',1.5)
xlabel('time (s)')
ylabel('y')


figure
% plot(u.time, 0.2*u.data, 'b','LineWidth',1.5)
xlabel('time (s)')
ylabel('u')
grid on
zoom on

figure
% plot(e.time, e.data, 'g','LineWidth',1.5)
xlabel('time (s)')
ylabel('e')
grid on
zoom on

save s270874
