close all
clear all
clc

code = menu('Choose the code you want to execute:',... 
            '1',...
            '2',...
            '3',...
            '4',...
            'Bode Plot',...
            'polar diagrams');

switch(code)
case 1  

% stady state 

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


case 3
% Step response analysis of prototype 1st order systems

% function with delay
s = tf('s');
H = 1/(s^2+s+1);
H.inputdelay = 2

case 4
s = tf('s');
H = 1/(s^2+s+1);
H.inputdelay = 2;
SYSX = zpk(pade(H,1))


case 5
% bode plots

s = tf('s')
H = 1/(s^2+3*s+2)
figure, bode(H)

case 6
% polar diagrams
s = tf('s')
H = 1/(s^2+3*s+2)
[re,im] = nyquist(H);
figure, plot(squeeze(re), squeeze(im))

end

