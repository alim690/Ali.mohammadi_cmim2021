clc
close all
%define function h(x)
h=@(x) sqrt(x);            
a = 0.0 + 0.01;     % This (a) value is suitable for sqrt(x),it can handle easily
b=2;
%------------------------------------------------------
%section c, plot for h(x) with both value of epsilon with two methods
eps = linspace(1e-1, 10e-10, 10);%The defined range for epsilon time from 1e-1 to 10e-10 with M=10 points.
n_trapezoidal = zeros(length(eps), 1);     %making an initial array for n in the trapezoidal method
n_midpoint = zeros(length(eps), 1);     %making an initial array for n in the midpoint method
for i = 1:length(n_midpoint)
    n_trapezoidal(i) = adaptive_integration(h, a, b, eps(i), '1');
    n_midpoint(i) = adaptive_integration(h, a, b, eps(i), '2');
end 
plot(log(eps), n_midpoint, 'g-', log(eps), n_trapezoidal, 'k-');
xlabel('log(eps)');
ylabel(' n for trapezoidal and midpoint');
lgd=legend({'midpoint','trapezoidal'},'Location','NorthEast');
title(lgd,'Plotted methods:')
