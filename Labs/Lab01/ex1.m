% Lab01 ex 1

% Compute the state x(t) and the output y(t) responses when x(0)=[2,2]T and the input u(t) is
% a step signal with amplitude 2.

clear all
clc

A = [1 2; 4 3]; B = [5 8]'; C = [-1 3]; D = 8;
%A = [1 2; 4 3]; B = [5;8]; C = [-1 3]; D = 8;

%s=tf('s');

%sys = ss(A,B,C,D)

% Compute the state x(t) and the output y(t) responses when x(0)=[2,2]T and the input u(t) is
% a step signal with amplitude 2.

s=tf('s');
U=2/s, x0=[2 2]';
%U=2/s, x0=[2;2];


X = minreal(inv(s*eye(2)-A)*(B*U + x0),1e-3);
Y = minreal(C*X + D*U,1e-3);

[num_X1,den_X1] = tfdata(X(1),'v');
[num_X2,den_X2] = tfdata(X(2),'v');
[num_Y,den_Y] = tfdata(Y,'v');

[r1,p1] = residue(num_X1,den_X1)
[r2,p2] = residue(num_X2,den_X2)
[r3,p3] = residue(num_Y,den_Y)

% stuff
% commands for cml
% clear all
% who
% load('ex1.m')
% who
% save blabla