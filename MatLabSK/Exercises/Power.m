function y = Power(x, n) 
    if n == 0 
        y = 1; 
    elseif (rem(n,2) == 1) 
        y = (Power(x, (n-1)/2))^2 * x;
    else
        y = (Power(x,n/2))^2; 
    end
end

        
       