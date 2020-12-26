function s = selectR(x,k)
% s is the kth smallest value in vector x
% selected by using a RANDOM splitter, using RECURSION.
% x is a vector of real values.
% k is an integer in [1..n] where n is the length of x.
littleVals = [];
bigVals = [];
splitter = ceil(rand * length(x)); %randomly generated splitter index
x1 = [x(1:splitter-1), x(splitter+1:length(x))]; %removes splitter from x

for j = 1:length(x1) %for loop creates littleVals and bigVals by comparing to splitter
    if x1(j) < x(splitter)
        littleVals = [littleVals, x1(j)];
    elseif x1(j)>= x(splitter)
        bigVals = [bigVals, x1(j)];
    end
end

if (k == length(littleVals) + 1) %base case
    s = x(splitter);
elseif k <= length(littleVals) %s is in littleVals
    s = selectR(littleVals, k); %recursively call littleVals
elseif k >= length(littleVals)+2
    s = selectR(bigVals, k-length(littleVals)-1); %s is in bigVals
end
end