%quadratic: x^2 + bx + c 

a = input('Enter a: ');
b = input('Enter b: ');
c = input('Enter c: ');
L = input('Enter L: ');
R = input('Enter R (L < R): ');
xc = -b/(2*a);

fprintf('Quadratic: ax^2 + bx + c, a = %5.3f b = %5.3f, c = %5.3f\n',a,b,c);
fprintf('Interval: [L,R], L = %5.3f, R = %5.3f\n\n', L, R);

if xc < L
    if (a>0)
    min = a*L^2 + b*L + c;
    max = a*R^2 + b*R + c; 
    fprintf('Minimum f value = %5.2f\n', min');
    fprintf('Maximum f value = %5.2f\n', max');
    else 
    min = a*R^2 + b*R + c;
    max = a*L^2 + b*L + c; 
    fprintf('Minimum f value = %5.2f\n', min');
    fprintf('Maximum f value = %5.2f\n', max');
    end
    
elseif xc > L && xc < R
    if (a>0)
    min = a*(xc)^2 + b*xc + c;
    maxright = a*R^2 + b*R + c;
    maxleft = a*L^2 + b*L + c;
    fprintf('Minimum f value = %5.2f\n', min');
        if maxright > maxleft
            fprintf('Maximum f value = %5.2f\n', maxright');
        else
            fprintf('Maximum f value = %5.2f\n', maxleft');
        end 
    else
    max = a*(xc)^2 + b*xc + c;
    minright = a*R^2 + b*R + c;
    minleft = a*L^2 + b*L + c;
        if minright < minleft
            fprintf('Minimum f value = %5.2f\n', minright');
            fprintf('Maximum f value = %5.2f\n', max');
        elseif minleft < minright
            fprintf('Minimum f value = %5.2f\n', minleft');
            fprintf('Maximum f value = %5.2f\n', max');
        else
            fprintf('Minimum f value (equivalent at both extremes) = %5.2f\n', minleft');
            fprintf('Maximum f value = %5.2f\n', max');
        end
    end
else 
    min = a*R^2 + b*R + c;
    max = a*L^2 + b*L + c; 
    fprintf('Minimum f value = %5.2f\n', min');
    fprintf('Maximum f value = %5.2f\n', max');
    end

 
    
    
    
        
      
    
            
    
  
    
