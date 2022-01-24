clc;
clear;
close all
f = @(t) exp(-(t-pi));
N = 100;
M = 100;
b = integrate_coeffs(f, N, M);
plot_filename = strcat('new_f_S_whenNis', num2str(100), '.pdf');
plot_approx(f, N, M, plot_filename);