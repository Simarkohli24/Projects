function x = mergeSortMine(y)
    len = length(y);
    value = len/2; 
    if len == 1
        x = y;
    else
        y = [mergeSortMine(y(1:value)) mergeSortMine(y(value+1:end))];
        x = sort(y);
    end
    disp(y)
    disp(x)
end
