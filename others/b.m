clear all
close all
clc

% Define the transfer function
H = tf([1 2], [1 5 6])

% Check for BIBO stability using isstable function
isstable(H)

% Plot the Bode plot and check the margins
margin(H)
