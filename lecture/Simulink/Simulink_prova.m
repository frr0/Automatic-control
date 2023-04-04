close all
clear all
clc

s = tf('s');

G = 2122.4/(s*(s+59.24));
C = 4.54*((1+(s/59.2))/(1+(s/218.8)));

r = 1;
da = 0;
dy = 0;

my_otuput = sim("prova.slx")

plot(my_otuput)

% Simulate the responses of y(t), u(t), e(t)
% For y(t) , evaluate
% 1. the steady state value y∞
% 2. the maximum overshoot Ŝ
% 3. the rise time tr
% 4. the settling time ts,1%

