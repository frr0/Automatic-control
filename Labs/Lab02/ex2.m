clear all
close all
clc

A = [1 2; 4 3]; B = [5; 8]; C = [-1 3]; D =[8];

% s=tf('s');

% X = zpk(minreal(inv(s*eye(2)-A),1e-3))
M = minpoly(A)
roots(M)
eig(A)
