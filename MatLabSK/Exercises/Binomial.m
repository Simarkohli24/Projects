
for n = 1:10
    for k = 1:n
        output = digitsOfBinCoef(n, k);
        digits = floor(log10(output)) + 1;
        fprintf('%2.0f', digits)
    end
    fprintf('\n');
end

