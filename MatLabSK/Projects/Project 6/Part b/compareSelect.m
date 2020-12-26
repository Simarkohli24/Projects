% Compare the random splitter and middle splitter for computing the median.

% Generate test data 
%   numNs*numTrials  random vectors of varying lengths
numNs= 4;
numTrials= 100;
x= cell(numNs,numTrials);
lenX= zeros(numNs,1);
for i= 1:numNs
    lenX(i)= 10^i+1;  % Vector length
                      % Use odd lengths for simplicity
    for j= 1:numTrials
        x{i,j}= ceil(rand(1,lenX(i))*1000);
        % Each cell of x is a vector whose median is to be found using our
        % two methods
    end
end

% Run both algorithms using the same test data
tr= zeros(numNs,1);  % Computation time using random splitter
tm= zeros(numNs,1);  % Computation time using middle splitter
for i= 1:numNs
    kIndex= ceil(lenX(i)/2);  % middle index (for finding the median)
    
    % Time the random splitter approach
    tic;         % tic starts a timer
    for j= 1:numTrials
        sr= selectR(x{i,j},kIndex);
    end
    tr(i)= toc;  % toc stops the timer
    
    % Time the middle splitter approach
    tic;
    for j= 1:numTrials
        sm= selectM(x{i,j},kIndex);
    end
    tm(i)= toc;
end

% Plot time vs length of x for both approaches on one set of axes
% (i.e., plot two curves within the same set of axes)
loglog(lenX,tr/numTrials,'b-o', lenX,tm/numTrials,'m-d')
title('Average time to compute the median value')
xlabel('Size of data')
ylabel('Time in seconds')
legendText= {'Random splitter', 'Middle splitter'};
legend(legendText, 'Location','NorthWest')

%Both splitters were mostly equal in the times it took to sort the data, it
%did not make much of a difference which splitter was used. This is because
%in a random assortment of numbers, the index of each number is completely
%arbitrary, so choosing a random index would be just as effective as
%choosing a middle index over the course of many trials.

%We chose to use loglog as the plotting function. Since we were increasing
%the size of the data by factors of 10 each time, the times it took to sort
%the data was also increased by about a factor of 10 each time. The loglog
%function helped to space the points on the graph evenly to help visualize
%their efficiency.