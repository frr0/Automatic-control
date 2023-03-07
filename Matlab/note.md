---
title: Matlab-Automatic Control
author: 
date: \today
abstract: |
geometry: "letterpaper,top=2cm,bottom=2cm,left=2cm,right=2cm"
fontsize: 11pt
urlcolor: red
toc: true

---
\newpage



# Matlab commands



```matlab
% LTI systems

clear all
clc


% simple matrices
A = [0 1;-2 -3]
B = [1;0]

% tranfert function
s=tf('s');
H = (s+5)/(s^2+3*s+2)

% poles and zeros
poles_H = pole(H)
zeros_H = zero(H)
zpk(H) % Zero-pole-gain form

% Use ss to obtain A, B, C, D
% ss = systyem state rapresentation
sys = ss(H)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example 3 L03

% Define the system input
U=2/s; x0=[2;2]

% Introduce the system transfer function

H = (2*s+1)/(s+4)^2

% -> use statements minreal and zpk, in order to simplify and highlight
% denominator roots respectively

Y = zpk(minreal(H*U,1e-3))

% For Y(s) , compute the PFE using the statements tfdata and residue

[num_Y,den_Y] = tfdata(Y,'v')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tf ss

% A = [-3 2;-2 -3]; B = [1;0]; C = [0 1]; D = 0;

%Use tf to obtain the transfer function H(s)
H = tf(sys)

% Use ss to obtain A, B, C, D
sys = ss(H)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example 2 L02

% Define the Laplace variabile s using tf statement
s = tf('s')

% Introduce the system matrices A, B and C
A = [-3 2;-2 -3], B = [1;0], C = [0 1]

% Define the system input and initial condition
U = 1/s, x0 = [1;1]

% Compute use statements minreal and zpk, in order to simplify and highlights
% denominator roots respectively
Y = zpk(minreal(C*inv(s*eye(2)-A)*(B*U+x0),1e-3))

% For Y(s) , compute the PFE using the statements tfdata and residue
[num_Y,den_Y] = tfdata(Y,'v')

[r,p] = residue(num_Y, den_Y)

% Compute magnitude and phase of the residue corresponding to the complex
% root with positive imaginary part

M = abs(r(1))

phi = angle(r(1))
```
