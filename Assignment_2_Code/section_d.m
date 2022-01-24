%test_integrate_coeffs()
% Check that sin(nt) are integrated exactly by trapezoidal
clc;
clear;
close all;
f = @(t) 1;
tol = 1E-14;
N = 10;  
M = 100;
b = integrate_coeffs(f, N, M); 
b
for n = 1:N
    err = abs(b(n))  % Supposed to be zero
    assert(err < tol, 'n = %d, err = %g', n, err)
 end
