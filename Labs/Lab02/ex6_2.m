clear all
close all
clc

syms p s % declare symbolic variables
%s=tf('s');

% p = ''; 
% p = 6;

A = (s^2 + (p + 1)*s + 4*p -2)

H = 4/A 

%p = linspace(-3, 3, 300);

%X = 0.5*(-p-1-sqrt((p.^2)-14.*p+9))
%Y = 0.5*(-p-1+sqrt((p.^2)-14.*p+9))

sol1 = solve(A, [s]);

s_sol = sol1.s   % print solution for x
p_sol = sol1.p   % print solution for y

%plot(X,p)
%grid on

%plot(Y,p)
%grid on