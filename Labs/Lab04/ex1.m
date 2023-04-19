close all
clear all
clc

% part 1

s = tf('s');

da = 0;

G = 1 / (1 + s)^2;

C = (1 + s)^2 / (s * ((1 + s) / 4));

r = 1/s;

u = r / (1 + G);

a = minreal(C*X + D*U,1e-3);

dy = (0.5/(s +0.5^2))*(1/s);

%y = ((G*C*r) + dy)/(1+G*C);
y = (G*C*r)/(1+G*C);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% part 2

% steady state
e = r - y;
dcgain(e)
[mag, phase] = bode(e, 0.1);
mag = mag * 3
phase

[n,d] = tfdata(e,'v')
[r,p] = residue(n,d)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% part 3

r = 3/s;
dy = 2/s;

dcgain(y)
[mag, phase] = bode(y, 0.1);
mag = mag * 3
phase

[n,d] = tfdata(y,'v')
[r,p] = residue(n,d)
