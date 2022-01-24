function plot_approx(f, N, M, filename)
    function result = S_N(b,t)
        sum = 0;
        for i = 1:N
            sum = sum + b(i)*sin((i)*t);
        end
        result = sum;
    end        
    int_start = -pi; 
    int_end = pi;
    time = linspace(int_start,int_end,100);
    y = f(time);
    b = integrate_coeffs(f, N, M);
    y_approx = S_N(b,time);
    figure(N)
    plot(time,y,'r.',time,y_approx,'b--');
    xlabel('t(s)');
    %legend({'f','S'},'Location','Northwest');    %for section_g
    legend({'new-f','S'},'Location','Northeast'); %for section_h
    title('SN when the N is:',N)
    print(filename, '-dpdf');
end

