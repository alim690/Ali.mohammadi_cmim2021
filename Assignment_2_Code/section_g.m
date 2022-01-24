clc;
clear;
close all;
f = @(t) (1/pi)*t;
N = 3;
M = 100;
b = integrate_coeffs(f, N, M);
 for N = [3 6 12 24]
   plot_filename = strcat('SN_while_Nis', num2str(N), '.pdf');
   plot_approx(f, N, M, plot_filename);
 end
  