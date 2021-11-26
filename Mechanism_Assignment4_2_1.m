% Mechanism_Assignment4 part 1 of 2: 
clc;clear;close;
% x = [teta; d];
a = 0.1;  %OA [m]
b = 0.2;  %AB [m]
phi= deg2rad(30);
% Defining a reasonable starting point
x0 = [0; a + b];
% Create functions for making f(x) and Jacobian matrix:
F = @(x) constraint(x, a, b, phi);
J = @(x) jacobian(x, b);
% Calling Newton-Raphson’s fuction 
eps = 1e-9;
[x, iteration_counter] = NR_method(F, J, x0, eps);
%Print for the results:
fprintf('\n\tMechanism valid position is for d = %.3g m and teta = %g deg\n\n', ...
    x(2), rad2deg(x(1)));
% Function for making f(x):
function P = constraint(x, a, b, phi)
teta= x(1);
d = x(2);
P = [a * cos(phi) + b * cos(teta) - d;a * sin(phi) - b * sin(teta)];
end
%Function for making Jacobian matrix:
function P = jacobian(x, b)
teta = x(1);
P = [-b * sin(teta), -1; -b * cos(teta), 0];
end