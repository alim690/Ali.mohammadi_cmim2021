% Special case implementation of a simple oscillator simulation using
omega= 2;
T0 = 2*pi/omega;
dt = T0/20;
%dt = T0/2000;
tk = 3*T0;
N_t = floor(tk/dt);
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);
% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;
% The implementation of Backwardward Euler method 
for n = 2:N_t+1
    u(n) = (u(n-1)+dt*v(n-1))/(1+(dt*omega)^2);
    v(n) = (v(n-1)-dt*omega^2*u(n-1))/(1+(dt*omega)^2);
end
%We called the function osc_energy in here to caculate U and K 
[K,U]=osc_energy(u, v, omega);
Total_energy=K+U;            %Sum of Sum of the kinetic and potential energy
figure
plot(t, u,'g-', t, X_0*cos(omega*t), 'b-');
legend('Numerical', 'Exact', 'Location', 'northeast');
xlabel('Time [s]');