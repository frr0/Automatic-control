syms x y  ;  % declare symbolic variables
syms p s;

eqn = 2*x^2 + 3*x - 4*y + 7 == 0;   % define equation
A = (s^2 + (p + 1)*s + 4*p -2)

sol = solve(eqn, [x, y]);   % solve for x and y

x_sol = sol.x;   % print solution for x
y_sol = sol.y;   % print solution for y

sol1 = solve(A, [s]);

s_sol = sol1.s   % print solution for x
p_sol = sol1.p   % print solution for y