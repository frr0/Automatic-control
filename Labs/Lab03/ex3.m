close all
clear all
clc

s = tf('s');

u = 5; % unitary amplitude (given)
y_inf = 1; % at infinite it goes to 1
% y = K * u => K = y/u = 1/5
K = 1/5 % gain

% peak point 
y_max = 1.16; %peak
t = 0.45; % time when peak y_max

s_ = (y_max - y_inf)/y_inf

% damping ratio
d = (abs(log(s_))/sqrt(pi^2 + log(s_)^2)) % damping ratio

% natural frequency
w = pi/(t * sqrt(1 - d^2)) % natural frequency

H = K*(w^2/(s^2 + 2 * d * w * s + w^2))

step(H)
stepinfo(H)
