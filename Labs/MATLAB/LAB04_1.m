close all;
clear all;
clc;

s = tf('s');
tol = 1e-3;

G = 1 / (1 + s)^2;
C = (1 + s)^2 / (s * (1 + s / 4));


%% First Part
da = 0;
dy = 0;

r = 1 / s;
R = C / (1 + G * C);
U = minreal(r * R, tol);

[num, den] = tfdata(U, 'v');
[res, pol] = residue(num, den);

% DONE U = 3/(s+2) - 2/(s+2)^2 + 1/s

%% Second Part
% Check the stability from the transfer function, not the output e
da = 0;
r = 0;

dy = 0.5 / (1 + s^2);
S = minreal(1 / (1 + C * G), tol);
%e = minreal(-dy * S, tol);

%pole(e); % -2, -2, 0+i, 0-i 

[m, p] = bode(-S, 1); % bode(S, w_0)

amp = m * 0.5;
phase = p * pi / 180;

% DONE  % PAY attention to the minus S

%% Third Part
% Stability: there is no any zero pole cancelation FOR the poles >= 0

r = 3 / s;
dy = 2 / s;
da = 0;

T = minreal((C * G) / (1 + C * G), tol);
S = minreal(1 / (1 + C * G),tol);
Y = minreal((r * C * G + dy) / (1 + C * G), tol);

% Since the inputs are just step functions:
dcgain(T);
dcgain(S);

% DONE % We can also check from the bode plot when the omega goes to zero.


