close all;
clear all;
clc;

s = tf('s');
tol = 1e-3;

stop_time = 100;

% Parameters
da = 0;
dy = 0;
l = 1.86e-4;
k = 0.005;
c = 3750;
N = 60;
R = 0.246;

% Input
r = 1;

% Plant
G = ((c^2/(2*N)) * exp(-s * R)) / ((s + (2*N / (R^2 * c))) * (s + 1 / R));


% First Part
C1 = l / (1 + s / k);

L = minreal(G * C1, tol);
T = minreal(L / (1 + L), tol);

stepinfo(T, "SettlingTimeThreshold", 0.01);

%my_output = sim('LAB04_2_SIM.slx');
%plot(my_output);


% Second Part
K_c = 9.64e-6;
z = 0.53;

C2 =  (K_c * (1 + s / z)) / (s);

L = minreal(G * C2, tol);
T = minreal(L / (1 + L), tol);
stepinfo(T, "SettlingTimeThreshold", 0.01)

my_output = sim('LAB04_2_SIM.slx');
plot(my_output);


