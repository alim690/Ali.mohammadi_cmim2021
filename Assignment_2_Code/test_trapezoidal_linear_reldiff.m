function test_trapezoidal_linear_reldiff()
    % Check that linear functions are integrated exactly
    f = @(x) (6e8*x)-(4e6);
    F = @(x) (3e8*x^2)-(4e6*x);       % Anti-derivative
    a = 1.2;  b = 4.4;
    exact = F(b) - F(a);
    tol = 1e-14;
    for n = [2 20 21]
        computed= trapezoidal(f, a, b, n);
        error = abs(exact - computed)/exact;
        assert(error < tol, 'n = %d, err = %g', n, error);
    end
end