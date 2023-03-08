% Lab01 ex 3
% compute the exponential matrix At
% e of the system;

clear all
close all
clc

A = [0 6; -1 -5]; 

s=tf('s');

X = minreal(inv(s*eye(2)-A),1e-3);

[num_X1,den_X1] = tfdata(X(1,1),'v');
[r1,p1] = residue(num_X1,den_X1)
[num_X2,den_X2] = tfdata(X(1,2),'v');
[r2,p2] = residue(num_X1,den_X1)
[num_X3,den_X3] = tfdata(X(2,1),'v');
[r3,p3] = residue(num_X1,den_X1)
[num_X4,den_X4] = tfdata(X(2,2),'v');
[r4,p4] = residue(num_X1,den_X1)