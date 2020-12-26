function s = selectM(x,k)
% s is the kth smallest value in vector x
% selected by using a MIDDLE splitter, using RECURSION.
% If x is even-length, define "middle" as length(x)/2.
% x is a vector of real values.
% k is an integer in [1..n] where n is the length of x.
littleVals = [];
bigVals = [];
r = length(x);

if rem(length(x), 2) == 1 %odd number of values in x
    splitter = ceil(r/2);
else
    splitter = r/2; %even number of x
end

x1 = [x(1:splitter-1), x(splitter+1:r)]; %removes splitter from x and creates new

for j = 1:length(x1)
    if x1(j) < x(splitter)
        littleVals = [littleVals, x1(j)];
    elseif x1(j)>= x(splitter)
        bigVals = [bigVals, x1(j)];
    end
end

if (k == length(littleVals) + 1)
    s = x(splitter);
elseif k <= length(littleVals)
    s = selectM(littleVals, k);
elseif k >= length(littleVals)+2
    s = selectM(bigVals, k-length(littleVals)-1);
end
end