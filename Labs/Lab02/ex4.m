clear all
close all
clc

A = [-1 2; 1 0];
B = [2; 0];
C = [1/2 -1/2];

s=tf('s');

X = zpk(minreal(C*inv(s*eye(2)-A),1e-3))
M = minpoly(A)
roots(M)
eig(A) %% -2 1 => unstable


% BIBO stability poles negatives
[num_X1,den_X1] = tfdata(X(1),'v');
[r1,p1] = residue(num_X1,den_X1)
