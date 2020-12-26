function s = createPath(l)
    for j = 1:2
        for k = 1:l
            s(j,k) = ceil(2*rand)-1; 
        end
    end
end
