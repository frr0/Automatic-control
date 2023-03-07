% Lab01 ex 1

clear all
clc

A = [1 2; 4 3]; B = [5;8]; C = [-1 -3]; D = 8;

s=tf('s');

sys = ss(A,B,C,D)

% Compute the state x(t) and the output y(t) responses when x(0)=[2,2]T and the input u(t) is
% a step signal with amplitude 2.
% sqwave = 2*square(pi*t)

s=tf('s');
U=2/s, x0=[2;2]


X = zpk(minreal(inv(s*eye(2)-A)*(B*U+x0),1e-3))

[num_X1,den_X1] = tfdata(X(1),'v')
[num_X2,den_X2] = tfdata(X(2),'v')
