% LTI systems

% simple matrices 
A = [0 1;-2 -3], B = [1;0]
 
s=tf('s')
 
U=2/s, x0=[2;2]
 
X = zpk(minreal(inv(s*eye(2)-A)*(B*U+x0),1e-3))

A = [-3 2;-2 -3], B = [1;0], C = [0 1]

Y = zpk(minreal(C*inv(s*eye(2)-A)*(B*U+x0),1e-3))

% ss = systyem state rapresentation

[num_Y,den_Y] = tfdata(Y,'v')

[r,p] = residue(num_Y, den_Y)

M = abs(r(1)), 2*M

phi = angle(r(1))