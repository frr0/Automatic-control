---
title: Title
author: Author
date: \today
abstract: |
  This is the abstract. It consists of two paragraphs.
geometry: "letterpaper,top=2cm,bottom=2cm,left=2cm,right=2cm"
fontsize: 11pt
urlcolor: red
toc: true
---
\newpage


# Prova



### Code


```Matlab 

s = tf('s');
% Define the system input and initial condition
U = 2/s;
x0 = [2;2];
% Define the system matrices
A = [0 1; -2 -3];
B = [1; 0];
% Compute X(s) = (sI-A)^-1 * [x(0) + BU(s)]
X = zpk(minreal(inv(s * eye(2) - A) * (B * U + x0), 1e-2))
% For each of the 2 components of X(s), compute the PFE
[num_x1, den_x1] = tfdata(X(1), 'v')
[r1, p1] = residue(num_x1, den_x1)
[num_x2, den_x2] = tfdata(X(2), 'v')
[r2, p2] = residue(num_x2, den_x2)

```

```Matlab 

s = tf('s');
% Define the system input and initial condition
U = 1/s;
x0 = [1;1];
% Define the system matrices
A = [-3 2; -2 -3];
B = [1; 0];
C = [0 1];
% Compute X(s) = C * (sI-A)^-1 * [x(0) + BU(s)]
Y = zpk(minreal(C * inv(s * eye(2) - A) * (B * U + x0), 1e-2))
% For each of the 2 components of X(s), compute the PFE
[num_y, den_y] = tfdata(Y, 'v')
[r, p] = residue(num_y, den_y)
% Compute magnitude and phase of the residue corresponding to the complex root with pos
itive imaginary part
M = abs(r(1))
phi = angle(r(1))
```


## stability and BIBO


```Matlab 
A = [0 1 0; -1 0 0; 0 0 -1];
% Compute the eigenvalues of A
eigenvalues = eig(A)
```

\newpage
## Steady state

### step input

Firstly we need to check if we can compute the steady state response (if the
system is internally stable), all the poles of H have strictly negative real part, so
the system is internally stable and we can proceed.

```Matlab 
s = tf('s');
H = 1/(s^3 + 2*s^2 + 5.25*s + 4.25);
H = zpk(minreal(H, 1e-2))
poles = pole(H)
u_bar_step = 2;
K = dcgain(H) * u_bar_step
```

# Sinusoidal input

```Matlab 
s = tf('s');
H = 1/(s^3 + 2*s^2 + 5.25*s + 4.25);
H = zpk(minreal(H, 1e-2))
poles = pole(H)
u_bar_sin = 3;
w0 = 0.1;
[mag, phi] = bode(H, w0)
% We should convert from degrees to radiants
phi_rad = phi / 180*pi
y_bar = mag * u_bar_sin
```
