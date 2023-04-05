close all
clear all
clc

s = tf('s');

H = 10/(s^2 + 1.6*s + 4);

% evaluate natural frequency, damping coefficient and constant tau of poles

step(H)
stepinfo(H)
