%initialize a matrix to be used for the simIsing model
function A = InitialIsing(n,p)
A = zeros(n, n); %establish a nxn matrix with zeros 
for i = 1:n %run through each row
    for j = 1:n %run through each colum
        random = rand; 
        if random <= p %assign random value and compare to probability
            A(i,j) = 1; %if probability satisfied, write "1" 
        else
            A(i,j) = -1; %if not, write "-1"
        end
    end
end
end




    
        
            
    
    
    

            