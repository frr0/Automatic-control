close all
clear all
clc

s = tf('s');

H = 10/(s^2 + 1.6*s + 4);

step(H)
stepinfo(H)
% return

% evaluate natural frequency, damping coefficient and constant tau of poles

y_inf = 2.5;
% peak point
y_max = 3.1344; %peak
t = 1.7269; % time when peak y_max

s_ = (y_max - y_inf)/y_inf

maximum_overshoot = s_ * 100

% damping ratio
d = (abs(log(s_))/sqrt(pi^2 + log(s_)^2)) % damping ratio

% natural frequency
w = pi/(t * sqrt(1 - d^2)) % natural frequency

tau = 1/(d * w)

% rise time is the time at which the function reachs for the first time the
% y_inf value, so about t=1.08s

% 5% settling time is the time

% 5% sattling time of 2.5

five_precent = 2.5 * 5/100
y_five_percent = 2.5 - five_precent

% time when functiont in y_five_percent = 2.3750 is 3.78s from the graph.

