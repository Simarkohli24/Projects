%initialize second variable to allow program to function
second = 0;
forward = true;

%let n run through all numbers between 1 and 100. Test inequality in the
%three parts first <= second <= third in their respective equations
if (forward == true)
    for n = 1:100
    
        %equations used to calculate values of inequality
        first = (2/3)*n*sqrt(n);
        second = sqrt(n) + second;
        third = ((4*n + 3)/6)*sqrt(n);
    
        %if n is a multiple of 10, then print out values
        if (rem(n, 10) == 0 )
            fprintf('    %3.0f     %7.3f     %7.3f     %7.3f\n', n, first, second, third); 
        end
    
        %check that the inequality works at every n value, and if n reaches
        %100 and the inequality is proven at this final step, then print
        %"the inequalities hold for all values of n", and if at any point
        %the inequality is proven wrong, then print "the inequalities doe
        %not hold for at least one value of n"
        if (first >= second) || (second >= third)
            forward = false;
            fprintf('The inequalities do not hold for at least one value of n.');
        elseif (n == 100) && (first <= second) && (second <= third)
            fprintf('The inequalities hold for all values of n'); 
        else 
            forward = true;
        end
    end
       
end

    
