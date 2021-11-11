% Special case implementation of a simple oscillator simulation using
% first-order Forward Euler solver.
omega= 2;
T0 = 2*pi/omega;
dt = T0/20;
tk = 3*T0;
N_t = floor(tk/dt);
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);
% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;
% The implementation of Forward Euler method 
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
end
%We called the function osc_energy in here to caculate U and K 
[K,U]=osc_energy(u, v, omega);
Total_energy=K+U;            %Sum of Sum of the kinetic and potential energy
figure
plot(t, Total_energy, 'm-');
title('Development of total energy with the Forward Euler method ')
ylabel('Sum of the kinetic and potential energy [K+U]')
xlabel('Time [s]');