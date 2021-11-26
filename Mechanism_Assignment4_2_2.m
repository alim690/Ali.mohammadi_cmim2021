clc;clear;close;
% x = [teta; d];
a = 0.1;  %OA [m]
b = 0.2;  %AB [m]
omega=1;  %rad/s
t=linspace(0,1,101);  %definition of an interval for the time between 0,1 with 101 steps
for n=1:length(t)  
    phi=(pi/6)+(omega*t(n)); %definition of new phi=(pi/6)+wt
% Defining a reasonable starting point
x0 = [0; a + b];
% Create functions for making f(x) and Jacobian matrix:
F = @(x) constraint(x, a, b, phi);
J = @(x) jacobian(x, b);
% Calling Newton-Raphson’s fuction 
eps = 1e-9;
[x, iteration_counter] = NR_method(F, J, x0, eps);
fprintf('\n\tMechanism valid position is for d = %.3g m and teta = %g deg\n\n', ...
    x(2), rad2deg(x(1)));
%Plot the d and theta for the interval (0,1) with n=101 steps:
subplot(2,1,1)
plot(t(n),x(2),'.b');hold on  %plot for d
legend('displacement [m]','Location', 'northeast');
xlabel('Time [s]');
ylabel('d [m]');
subplot(2,1,2)
x_1=rad2deg(x(1));
plot(t(n),x_1,'.r'); hold on  %plot for teta
legend('teta[deg]','Location', 'southeast');
xlabel('Time [s]');
ylabel('teta [deg]');
end
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
