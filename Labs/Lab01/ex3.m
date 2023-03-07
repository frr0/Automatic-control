% Lab01 ex 3    

clear all
clc

A = [0 6; -1 -5]; B = [0; 1]; C = [1 0]; D = 0;

s=tf('s');

sys = ss(A,B,C,D)

% Compute the state x(t) and the output y(t) responses when x(0)=[2,2]T and the input u(t) is
% a step signal with amplitude 2.
% sqwave = 2*square(pi*t)

s=tf('s');
U=1/(s-A), x0=[0;0]


X = zpk(minreal(inv(s*eye(2)-A)*(B*U+x0),1e-3))

% [num_X1,den_X1] = tfdata(X(1),'v')

% [num_X2,den_X2] = tfdata(X(2),'v')
