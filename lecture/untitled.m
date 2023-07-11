A = [-1 2; 1 0];
B = [2; 0];
C = [0.5 -0.5];
D = 0;
s = tf('s');
% Compute the H transfer function
sys = ss(A, B, C, D);
H = tf(sys);
H = zpk(minreal(H, 1e-2))
% Compute the poles of H and check the real part.
pole(H)
