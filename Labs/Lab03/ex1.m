% in steady state IF POSSIBLE you can compute it in the system is
% asymptotically stable and BIBO stable.

close all
clear all
clc

s = tf('s');

H = 1/(s^3 + 2*s^2 + 5.25*s + 4.25);

U1 = 0.1/(s^2 + 0.1^2);
U2 = 3/(s^2 + 9);

dcgain(H)
[mag, phase] = bode(H, 0.1);

mag = mag * 3
phase
