
function test_trapezoidal2()
  test_trapezoidal_linear_scale();
  test_trapezoidal_linear_reldiff();
end
% Check that scaled linear functions are integrated exactly
function test_trapezoidal_linear_scale()
    f=@(x) (6e8*x)-(4e6);
    F=@(x) (3e8*x^2)-(4e6*x);        % Anti-derivative
    a=1.2/6e8;b=4.4/6e8;             % Change the scale of the interval to reduce the inaccuracy
    exact=F(b)-F(a);
    tol=1e-14;
    for n=[2 20 21]
        computed=trapezoidal(f, a, b, n);
        error =abs(exact-computed)   % the absolute difference between exact and computed values
        assert(error < tol, 'n = %d, err = %g', n, error);
    end
end
% Check that linear functions are integrated exactly
function test_trapezoidal_linear_reldiff()
    f=@(x) (6e8*x)-(4e6);
    F=@(x) (3e8*x^2)-(4e6*x);       % Anti-derivative
    a=1.2;b =4.4;                   % Initial interval condition
    exact=F(b)-F(a);                %the exact value 
    tol=1e-14;
    for n=[2 20 21]
        computed = trapezoidal(f, a, b, n);
        error=abs(exact - computed)/exact %the relative difference between exact and computed values
        assert(error < tol, 'n = %d, err = %g', n, error);
    end
end