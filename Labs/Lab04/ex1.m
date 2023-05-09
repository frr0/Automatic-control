close all
clear all
clc

%% part 1

% Compute the time response of the control input u(t),
% when r(t) is a unit step and the
% other inputs (i.e., d a and dy) are set to zero.

s = tf('s');
da = 0;

G = 1 / (1 + s)^2;
C = (1 + s)^2 / (s * ((1 + s) / 4));

r = 1/s;

R = C / (1 + G * C);
U = minreal(r * R, tol);

[num, den] = tfdata(U, 'v');
[res, pol] = residue(num, den);

% u = r / (1 + G);
% a = minreal(C*X + D*U,1e-3);
% dy = (0.5/(s +0.5^2))*(1/s);
% y = ((G*C*r) + dy)/(1+G*C);
% y = (G*C*r)/(1+G*C);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% part 2

da = 0;
r = 0;

dy = 0.5 / (1 + s^2);
S = minreal(1 / (1 + C * G), tol);

[m, p] = bode(-S, 1); % bode(S, w_0)
amp = m * 0.5;
phase = p * pi / 180;

% steady state
% e = r - y;
% dcgain(e)
% [mag, phase] = bode(e, 0.1);
% mag = mag * 3
% phase

% [n,d] = tfdata(e,'v')
% [r,p] = residue(n,d)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% part 3

r = 3/s;
dy = 2/s;

dcgain(y)
[mag, phase] = bode(y, 0.1);
mag = mag * 3
phase

[n,d] = tfdata(y,'v')
[r,p] = residue(n,d)
