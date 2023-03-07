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

% Compute Y (s )  H ( s ) U (s )
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
% LTI systems representation
% example 4 L03

 A = [-3 2;-2 -3]; B = [1;0]; C = [0 1]; D = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example 2 L02

X = zpk(minreal(inv(s*eye(2)-A)*(B*U+x0),1e-3))

A = [-3 2;-2 -3]
B = [1;0]
C = [0 1]

Y = zpk(minreal(C*inv(s*eye(2)-A)*(B*U+x0),1e-3))

sys = ss(A,B,C,D)



[num_Y,den_Y] = tfdata(Y,'v')

[r,p] = residue(num_Y, den_Y)

M = abs(r(1))

phi = angle(r(1))
