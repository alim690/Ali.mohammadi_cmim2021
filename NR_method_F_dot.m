% Use Newton-Raphson’s method to solve systems of nonlinear algebraic equations.
function [xdot, iteration_counter_2] = NR_method_F_dot(Fdot, J,xdot, eps)
% Solve nonlinear system F=0 by Newton-Raphson’s method.
% J is the Jacobian of F. Both F and J must be functions of x.
% At input, x holds the start value. The iteration continues
% until ||F|| < eps.
F_value = Fdot(xdot);
%J_value = J_dot(x,x_dot);
F_norm = norm(F_value); % L2 norm of vector
iteration_counter_2 = 0;
while F_norm > eps && iteration_counter_2 < 100
    %delta = J_value\-F_value;
    delta = J(xdot)\-F_value;
    xdot = xdot + delta;
    F_value = Fdot(xdot);
    F_norm = norm(F_value);
    iteration_counter_2 = iteration_counter_2 + 1;
end
% Here, either a solution is found, or too many iterations
if F_norm > eps
    iteration_counter_2 = -1;
end
end