function med = myMedian(x)
% med is the median of real-valued vector x.
% Make effective use of selectR. Do not use built-in functions median or sort.

len = length(x);
if rem(len, 2) == 1 %odd number of x values
    med = selectR(x, ceil(len/2));
else %even number of x
    a = selectR(x, (len/2));
    b = selectR(x, (len/2 + 1));
    med = (a + b)/2; %average of two middle values
end

end