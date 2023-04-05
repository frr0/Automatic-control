close all
clear all
clc

code = menu('Choose the code you want to execute:',... 
    '1',...
    '2',...
    '3',...
    '4',...
    '5');

s = tf('s');

switch(code)
  case 1  
    H = 5/(s^3)
  case 2
    H = .25/(s^2 * (1 - .5 * s)^2)
  case 3
    H = (s - 1)/(s^3 - 9 * s)
  case 4
    H = (1 + .5 * s)/((1 + s) * (1 - s)^2)
  case 5
    H = (s^2 + 1)/((s^2 - 4) * (s + 4))
  end

% bode plots
figure, bode(H)
% polar diagrams
[re,im] = nyquist(H);
figure, plot(squeeze(re), squeeze(im))
% Nyquist diagram
figure, nyquist(H)
% Nichols diagram
figure, nichols(H)
