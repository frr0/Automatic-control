clear all
close all
clc

A = [-2 0 0; 0 0 1; 0 0 0];

% s=tf('s');

% X = zpk(minreal(inv(s*eye(3)-A),1e-3))
M = minpoly(A)
roots(M)
eig(A) % 0 0 -2

% algebraic multiplicity mu1 = 2, mu2 = 1

% An LTI system is unstable if and only if either there is at least one eigenvalue with
% strictly positive (>0) real part or all the system eigenvalues have nonpositive ( 0)
% real part and those ones with null real part have minimal polynomial multiplicity
% larger than 1.
