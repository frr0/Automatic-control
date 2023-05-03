close all;
clear all;
clc;

s = tf('s');

% write a transfer function (plant tf)
G = 2/((1+.2*s)*(1+.1*s));

% stady state controlller

Kc = 5 % u can see on input

C_SS =Kc/s;
L1 = G * C_SS;  % loop t function update


% transirìent requirement

T_p = 3,40; % dB
S_p = 4.91; %dB
wc_des=6.5;

%nichols diagram

figure(1)
nichols(L1, 'b'), hold on
T_grid(T_p) % you see loops
S_grid(S_p) % but u have to use functions downloaded
% return


% lead network design 

mD = 12;

wnorm = .9

WD = wc_des/wnorm
C_D = (1+s/WD)/(1+s/(mD*WD));
L2 = L1*C_D;% loop tf update
C = C_SS*C_D % contreoller tf  upd


% plot smtng
figure(1)
nichols(L2, 'r')
% return

t_stop=3;

rho = 1;
delta_a=0;
delta_y=0;
out= 

