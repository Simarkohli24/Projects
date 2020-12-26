%calculate the potential of a cell

function P = Potential(A, i, j)
%initialize certain variables and boolean operators (the operators
%which will prevent running two different calculations on the same cell)
E = 0; Enot = false;
S = 0; Snot = false;
W = 0; Wnot = false;
N = 0; Nnot = false;
[a,b] = size(A);
    %calculate N E S W when cells are on edges
    if j == a
        E = A(i,1);
        Enot = true; 
    end
    if i == a
        S = A(1,j);
        Snot = true; 
    end
    if j == 1
        W = A(i,a);
        Wnot = true;
    end
    if i == 1
        N = A(a,j); 
        Nnot = true;
    end
    %If cell is determined to not be on the edge, run the following
    %calculations. If a cell is on the edge, do not calculate neighbor as
    %normal (as it will lead to an error). Boolean operators prevent this
    %from happening.
    if Enot == false 
        E = A(i,j+1);
    end
    if Snot == false
        S = A(i+1,j); 
    end
    if Wnot == false
        W = A(i,j-1);
    end
    if Nnot == false
        N = A(i-1,j);
    end
    P  = A(i,j)*(N+E+S+W);

end