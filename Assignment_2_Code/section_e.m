clc;clear 
f = @(t) (1/pi)*t;
N = 3;
M = 100;
b = integrate_coeffs(f, N, M);
fprintf('b1=%.7f\nb2=%.7f\nb3=%.7f\n',b(1),b(2),b(3))
