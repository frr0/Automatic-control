close all
clear all
clc

parte = menu('scegli quale esercizio:',...
              '1',...
              '2',...
              '3');
switch(parte)
case 1

s = tf('s');
% H = 1/((s+2)*(s+10));
% K = dcgain(H)
H = 1/(s*(s+2)^2);
K = dcgain(s*H)


case 2

s = tf('s');
H = 1/((s+2)*(s+10));
w0 = 0.5;
[m,f] = bode(H,w0)

f_rad=f/180*pi

end