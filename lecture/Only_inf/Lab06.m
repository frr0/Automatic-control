close all;
clear;
clc;

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