function [y,TotalC,TotalS] = BubbleSort(x)
% x is a column n-vector.
% y is a column n-vector obtained by permuting the values in x so
% that they are ordered from smallest to largest.
% TotalC is the total number of required comparisons.
% TotalS is the total number of required swaps.
    n = length(x);
    k = 1;
while (k==1 || S>0) && k<=n-1
    [x(k:n),C,S] = Bubble(x(k:n));
    k = k+1;
end
    y = x;
end

function [y,C,S] = Bubble(x)
% x is a column n-vector.
% y is a column n-vector obtained by applying the bubble
% process to x.
% C is the number of required comparisons.
% S is the number of required swaps.
    n = length(x); C = 0; S = 0;
for k=n-1:-1:1
    C = C + 1;
    if x(k+1) < x(k)
        t = x(k+1);
        x(k+1) = x(k);
        x(k) = t;
        S = S + 1;
    end
end
y = x;
end