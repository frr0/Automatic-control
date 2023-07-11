 close all;
clear;
clc;

A = [-0.4, -1; 1, 0];
B = [1; 0];
C = [0 1];
D = 0;

x0 = [-0.1; 0.5];

%% study osservability

Mo =obsv(A,C)
rho_Mo = rank(Mo)

lambda_obsv_des = [-1, -1];
L = acker(A', C', lambda_obsv_des)'
eig(A-L*C)

% observer systesm

sys_obsv = ss(A-L*C, [B L], eye(2), 0);
x0_hat = [0;0]; % estimated state init conditions

return

sim....

%%==============================================================
%% check reachability

M_r = ctrb(A, B)
rho_M = rank(M_r)

%% comèute k (you have to know the eig) than damping and freq

% def requirem

s_hat = .10;
t_s2 = 6.5;
zeta = abs(log(s_hat))/(sqrt(pi^2)+ (log(s_hat))^2);
wn = log((2/100)^(-1))/(zeta*t_s2);

% eig
lamda1 = -zeta*wn+j*wn*sqrt(1-zeta^2);
lamda2 = -zeta*wn+j*wn*sqrt(1-zeta^2);
lambda_des = [lamda1 lamda2];

% compute k
k = place(A,B,lambda_des)
% return

A_c = A - B * k;
B_c = B;
C_c = C;
D_c = D;
sys_c = ss(A_c, B_c, C_c, D_c);

% comp N

N = 1/dcgain(sys_c)

%% simulation

sys_x = ss(A,B,eye(2), 0); % to obtain a lti systems w/ state as input

t_stop = 2.5;
rho = 1;
d_y = 0;
d_a = 0;
d_t = 0;
wt = -90;

out = sim("lab6.slx")
plot(out.y.Time, out.y.Data)
