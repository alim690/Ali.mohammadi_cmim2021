function b_coeffs = integrate_coeffs(f, N, M)
    b = zeros(N,1);
    int_start = -pi;    %The lower limit of integral
    int_end = pi;       %The upper limit of integral
    for n = 1:N
        f_sin = @(t) f(t)*sin(n*t);      %Inside of the integral
        b(n) = (1/pi)*trapezoidal(f_sin, int_start, int_end, M);   %calculation of b(n)
    end
    b_coeffs = b;
end

