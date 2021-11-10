%Definded function for Kinetic and Potential energy
function [K,U]= osc_energy(u, v, omega)
K=0.5*v.^2;            %Kinetic energy    
U=0.5*omega.^2*u.^2;   %Potential energy
end