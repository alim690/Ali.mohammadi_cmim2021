clc;clear
close all
T=100;
dt=20; 
M=500;
r_bar=0.1;
f = @(u,t) (r_bar)*(1-u/M)*u;           % Logistic population growth
U_0 = 100;
[u_past, t_past] = ode_FE(f, U_0, dt, T); %Caculating the timestep dt_(k-1)

for k=1:10000
    dt_k = 2^(-k)*dt;   %Timestep define
    [u_new, t_new] = ode_FE(f, U_0, dt_k, T);%Caculating the timestep dt_k
    plot(t_past, u_past, 'r-', t_new, u_new, 'b--')%Plot for last two step dt_k and dt_(k-1)
    legend('t-past, u-past', 't-new, u-new', 'Location','southeast');
    xlabel('Time [s]'); 
    ylabel('N(t)'); 
    fprintf('The timestep for this plot was: %g [s]\n', dt_k);
    Question= input('Do you want to try better dt to see efficient result(y/n)? ', 's');
    if Question=='y'
        u_past = u_new;
        t_past = t_new;
    else
       break
    end
end
   