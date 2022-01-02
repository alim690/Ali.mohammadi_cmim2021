clc;clear;close;
% x = [teta; d];
a = 0.1;  %OA [m]
b = 0.2;  %AB [m]
omega=1;  %rad/s
phi_dot = -1; %rad/s
t=linspace(0,1,101);  %definition of an interval for the time between 0,1 with 101 steps
for n=1:length(t)  
    phi=(pi/6)+(omega*t(n)); %definition of new phi=(pi/6)+wt
% Defining a reasonable starting point
x0 = [0; a + b];
xdot0 = [0;0];
% Create functions for making f(x) and Jacobian matrix:
F = @(x) constraint(x, a, b, phi);
F_dot=@(x,x_dot) constraint_dot(x,x_dot, a, b, phi,phi_dot);
J = @(x) jacobian(x, b);
% Calling Newton-Raphson’s function for calculating the x
eps = 1e-9;
[x, iteration_counter] = NR_method(F, J, x0, eps);
fprintf('\n\tMechanism valid position is for d = %.3g m and teta = %g deg\n\n', ...
    x(2), rad2deg(x(1)));
% Create functions for making f'(x)
Fdot=@(xdot) constraint_d(x, xdot, a, b, phi,phi_dot);
% Calling Newton-Raphson’s function for calculating the x_dot
[xdot, iteration_counter_2]= NR_method_F_dot(Fdot, J,xdot0, eps);
fprintf('\n\tMechanism valid position is for d_dot = %.3g m and teta_dot = %g deg\n\n', ...
    xdot(2), rad2deg(xdot(1)));
%Plot the d and theta for the interval (0,1) with n=101 steps:
subplot(2,1,1)
plot(t(n),xdot(2),'.b');hold on  %plot for d_dot
legend('d-dot [m]','Location', 'northeast');
xlabel('Time [s]');
ylabel('d-dot [m]');
subplot(2,1,2)
x_1_dot=rad2deg(xdot(1));
plot(t(n),x_1_dot,'.r'); hold on  %plot for teta_dot
legend('teta-dot [deg]','Location', 'southeast');
xlabel('Time [s]');
ylabel('teta-dot [deg]');
end
% Function for making f(x):
function P = constraint(x, a, b, phi)
teta= x(1);
d = x(2);
P = [a * cos(phi) + b * cos(teta) - d;a * sin(phi) - b * sin(teta)];
end
% Function for making f'(x):
function h = constraint_d(x, xdot, a, b, phi,phi_dot)
teta= x(1);
teta_dot= xdot(1);
d_dot = xdot(2);
h = [-a *phi_dot* sin(phi) - b * teta_dot*sin(teta) - d_dot;...
      a *phi_dot* cos(phi) - b * teta_dot*cos(teta)];
end
%Function for making Jacobian matrix:
function P = jacobian(x, b)
teta = x(1);
P = [-b * sin(teta), -1; -b * cos(teta), 0];
end
