clear all
close all
clc


syms s p    % declare symbolic variables

a = 1;   % coefficient of s^2
b = p + 1;   % coefficient of s
c = 4*p - 2;   % constant term

% quadratic formula
delta = b^2 - 4*a*c;
s1 = (-b + sqrt(delta))/(2*a);
s2 = (-b - sqrt(delta))/(2*a);

% print solutions
s1   % root 1
s2   % root 2