function [idx, val] = strongestColor(Q, i, j, s)
    iMin = i - s; 
    iMax = i + s; 
    jMin = j - s; 
    jMax = j + s; 
    [nr,nc,np] = size(Q); 
    total = 0;
    if iMin < 1
        iMin = 1; 
    end
    if jMin < 1 
        jMin = 1; 
    end
    if iMax > nr
        iMax = nr; 
    end
    if jMax > nc 
        jMax = nc; 
    end
        for j = iMin:iMax 
            for k = jMin:jMax
                total = Q(j,k,:) + total;
                disp(total);
            end
        end
        a = uint8(total/((iMax - iMin + 1)*(jMax - jMin + 1)));
        disp(a);
        val = max(a);
        for n = 1:np
            if a(:,:,n) == val
                idx = n;
            end
        end
        
    
   
    
    
        
    
    
    