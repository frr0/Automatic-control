close all
clear all
clc

s = tf('s');

% q = queue length (packets)
% p = probability of packet mark/drop
% c = link capacity (packets/s)
% N = load factor (number of TCP sessions)
% R = round trip time (s) 

% Given the following controller and plant parameter values

l = 1.86 * 10^-4;
k = 0.005;
c = 3750;
N = 60;
R = 0.246;

q = ((c^2)*(e^(-s*R)))/(2*n)

p = (s + (2*N)/(R^2 * c))*(s + 1/R);

G = q/p;



G = 2122.4/(s*(s+59.24));
C = 4.54*((1+(s/59.2))/(1+(s/218.8)));

r = 1;
da = 0;
dy = 0;

my_otuput = sim("ex2.slx")

plot(my_otuput)

% Simulate the responses of y(t), u(t), e(t)
% For y(t) , evaluate
% 1. the steady state value y∞
% 2. the maximum overshoot Ŝ
% 3. the rise time tr
% 4. the settling time ts,1%

stepinfo()

