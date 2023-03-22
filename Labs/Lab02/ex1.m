clear all
close all
clc

A = [0 1; -1 -1]; B = [4 0; 10 1]; C = [1 0]; D =[0 0];

% s=tf('s');

% X = zpk(minreal(inv(s*eye(2)-A),1e-3))
M = minpoly(A)
roots(M)
eig(A)

% internally stable if Re(eig1)<=0
