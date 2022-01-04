clc
%define two functions f(x) and h(x)
f=@(x) x^2;
h=@(x) sqrt(x);
%eps=1e-1;          % the first defined value for epsilon
eps = 1e-10;       % the second defined value for epsilon
%a=0;            
a = 0.0 + 0.01;     % This (a) value is suitable for sqrt(x),it can handle easily
b=2;
%------------------------------------------------------------------
%Finding Suitable n for function f(x)=x^2:
n = adaptive_integration(f, a, b, eps, '1'); %number 1 is refer to the trapezoid method
if n > 0
   fprintf('The suitable n for f(x) is: %d \n', n);
else
    fprintf('There is No suitable value for n in %d episodes \n', abs(n));
end
n = adaptive_integration(f, a, b, eps, '2');  % 'number 2 is refer to the trapezoid method
if n > 0
    fprintf('The suitable n for f(x) is: %d \n', n);
else
    fprintf('There is No suitable value for n in %d episodes \n', abs(n));
end
%-----------------------------------------------------------------------
%Finding Suitable n for function h(x)=sqrt(x):

n = adaptive_integration(h, a, b, eps, '1');
if n > 0
    fprintf('The suitable n for h(x) is: \n %d', n);
else
    fprintf('There is No suitable value for n in %d episodes \n', abs(n));
end

n = adaptive_integration(h, a, b, eps, '2');
if n > 0
    fprintf('The suitable n for h(x) is:%d \n', n);
else
    fprintf('There is No suitable value for n in %d episodes \n', abs(n));
end
