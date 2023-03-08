% Lab01 ex 2
% Compute the output y(t) response when x(0)=[0,0]T, and u1(t) = 0, u2(t) = 2 (t).

clear all
close all
clc

A = [0 1; -1 -1]; B = [4 0; 10 1]; C = [1 0]; D =[0 0];


% Compute the state x(t) and the output y(t) responses when x(0)=[2,2]T and the input u(t) is
% a step signal with amplitude 2.

s=tf('s');
U=[0;2]; x0=[0;0];


X = minreal(inv(s*eye(2)-A)*(B*U+x0),1e-3);
Y = minreal(C*X, 1e-3);

[num_Y,den_Y] = tfdata(Y,'v');

[r,p] = residue(num_Y,den_Y)

M = abs(r(1))

M2 = 2*M

phi = angle(r(1))