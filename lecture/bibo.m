clear all
close all
clc

% Define the transfer function of the system you want to check for BIBO 
% stability. For example, let's consider the following transfer function:

% Define the transfer function
H = tf([1 2], [1 5 6])

% Use the isstable function to check whether the system is stable or not.
% This function returns a logical value (true or false) indicating the 
% stability of the system. If the system is BIBO stable, the output will 
% be true.

% Check for BIBO stability using isstable function
isstable(H)

%Alternatively, you can use the margin function to plot the Bode plot of 
% the system and check the phase margin and gain margin. If both the phase
% margin and gain margin are positive, the system is BIBO stable. Here's an
% example:

% Plot the Bode plot and check the margins
margin(H)
