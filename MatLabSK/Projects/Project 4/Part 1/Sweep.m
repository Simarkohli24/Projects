%function that sweeps throughout the entire matrix and changes values
%accordingly

function A = Sweep(A,T)
    [a,b] = size(A); %get n value where n is one dimension of the column (e.g. row or column)
    for r = 1:(a^2) %iterate and conduct a metropolis sweep
        irand = ceil(a*rand); %get random i value for A(i,j)
        jrand = ceil(a*rand); %get random j value for A(i,j)
        P = Potential(A, irand, jrand); %get the potential of randomly chosen cell
        %two conditions
        if P < 0
            A(irand, jrand) = A(irand, jrand)*-1; %if P<0 flip value
        else
            if rand < exp(-(2*P)/T) 
                A(irand, jrand) = A(irand, jrand)*-1; %acccording to probability function (e^((-2*p)/T)) if P satisfies, flip value
            end
        end   
    pcolor(A) %get color of matrix A each time new cell is chosen and modified (or not modified)
    pause(0.0001)
    end
end

    