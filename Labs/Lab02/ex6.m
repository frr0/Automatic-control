clear all
close all
clc

s=tf('s');

% p = ''; 
% p = 6;
% H = 4/(s^2 + (p + 1)*s + 4*p -2)

p = linspace(-3, 3, 300);

X = 0.5*(-p-1-sqrt((p.^2)-14.*p+9))
Y = 0.5*(-p-1+sqrt((p.^2)-14.*p+9))

plot(X,p)
grid on

%plot(Y,p)
%grid on
