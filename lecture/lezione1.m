 A = [0 1;-2 -3], B = [1;0]
 s=tf('s')
 U=2/s, x0=[2;2]
 X = zpk(minreal(inv(s*eye(2)-A)*(B*U+x0),1e-3))