function n_result= adaptive_integration(f, a, b, eps, method) 
n=2; 
%This section will find a value for n:
if (method == '1')                                %1 is referred to as the trapezoidal method
     integral_n_size = trapezoidal(f, a, b, n);   %Integral with size of n=2,3...,1000000
     integral_2n_size = trapezoidal(f, a, b, 2*n);%Integral with size of 2n
     difference=abs(integral_2n_size - integral_n_size); %Difference between two sizes of integral
     fprintf('The trapezoidal difference is:%g\n', difference); 
  while (difference > eps) && (n <1000000)        %the number of n is limited to 1000000 to avoid an infinite loop.
     integral_n_size=trapezoidal(f, a, b, n);
     integral_2n_size=trapezoidal(f, a, b, 2*n);
     difference=abs(integral_2n_size - integral_n_size);
     fprintf('The trapezoidal difference is:%g\n', difference);
     n=2*n;
  end
elseif method =='2'                               %2 is referred to as the midpoint method
        integral_n_size = midpoint(f, a, b, n);
        integral_2n_size = midpoint(f, a, b, 2*n);
        difference= abs(integral_2n_size - integral_n_size);
        fprintf('The midpoint difference is:%g\n', difference); 
     while (difference > eps) && (n<1000000)
        integral_n_size = midpoint(f, a, b, n);
        integral_2n_size= midpoint(f, a, b, 2*n);
        difference= abs(integral_2n_size - integral_n_size);
        fprintf('The midpoint difference is:%g\n', difference);
        n=2*n;
     end
else
    disp('Error-the function (adaptive_integration) called with unknown parameter');
end
%this section will evaluate the n which is found in the above section
if difference <= eps     % The n that is found is valid
   fprintf('The integral computes to: %g \n', integral_2n_size);
   n_result=n;
else
   n_result=-n;          % it will return -n to demonstrate that the n is not found
end
end