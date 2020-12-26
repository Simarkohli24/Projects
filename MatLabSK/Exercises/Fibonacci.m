% Fibonacci
clc
f_old = 0; 
f_cur = 1; 
f_new = 1;
n = 1;
check = 1;
cont = true;

% f_cur is the nth Fibonacci number
    while (check >= 0.000001)
        % Update: 
        f_new = f_old + f_cur; 
        f_old = f_cur; 
        f_cur = f_new; 
        n = n+1;
        check = abs(((f_new/f_cur) - ((1 + sqrt(5))/2)));
    end
    
    fprintf('%2d', n);

