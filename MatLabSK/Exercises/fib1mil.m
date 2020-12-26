% Fibonacci
clc
f_old = 0; 
f_cur = 1; 
f_new = 0;
n = 1;
% f_cur is the nth Fibonacci number
while ((f_new < 1000000))
    %fprintf('%2d %10d\n',n,f_cur)
    % Update: 
    f_new = f_old + f_cur; 
    f_old = f_cur; 
    f_cur = f_new; 
    n = n+1;
    if (f_new > 10000)
        fprintf('%2d %10d\n',n,f_new)
    end
    
end