%% Project 5 answers
% This script file calls your functions in order to compute the requested
% answers.

%% Use CELL ARRAY to house the soccer data

% Constants
xSize = 105;  % Length in meters (x dimension) of the field  
ySize = 68;   % Width in meters (y dimension) of the field
% Optional: set additional constants here

% Task 0. Parse a csv string with parseStr function
csvStr = 'apple,orange,banana';
%%%%
%%%% Uncomment the call to parseStr and the fprintf below %%%% 
%%%%

dataCellArray = parseStr(csvStr);
fprintf('\n0. dataCellArray{1,2} is %s \n', dataCellArray{1,2}) 
  % should be orange

  % Task 1. Read and store player data in a cell array. Display the number of
% players represented in the data file.
fprintf('\n1. Read player data from file and store in cell array\n')


playerData1 = playerDataInCellArray(); %store output of playerDataInCellArray
v = size(playerData1); %set v to size of the array
nPlayers = v(1,1); %take the first value (rows) to determine the number of players

 fprintf('There are %d players in this match\n', nPlayers)


% Task 2. Read, process, and store event data in a cell array. Display the
% number of events represented in the data file.
fprintf('\n2. Read match data from file and store in cell array\n')

eventData = eventDataInCellArray(playerData1, xSize, ySize); %store output of eventDataInCellArray() into variable eventData
nEvents= size(eventData,1); %find size of eventData
%%%%
%%%% Write your code here so that the fprintf below can be uncommented %%%%
%%%%

fprintf('There are %d events in this match\n', nEvents)

% Task 3. Where did most events take place in the field?
fprintf('\n3. Investige where in the field most events took place\n')
%%%%
%%%% Write your code here so that the fprintf below can be uncommented %%%%
%%%%

[winPossessionTeam, possessionData] = eventAnalysis(eventData, xSize); %run eventAnalysis() using inputs of eventData and xSize and output in winPossessionTeam and possessionData

 fprintf('Most events took place in %s team''s offensive half\n', winPossessionTeam);

% Task 4. Analyze attempts to get inside opponent's penalty box
fprintf('\n4. Plot and analyze attempts to get inside opponents''s box \n')
drawPitch();
%%%%
%%%% Write your code here so that the fprintf below can be uncommented %%%%
%%%%
team = 'DE';
[entriesFrac, attempts] = attemptToBox(team, eventData); %run attemptToBox
title('Blue = German successes, Yellow = Argentinian successes, White = failures') %title
fprintf('The success rate of getting inside opponent''s box was %.2f%% \n', entriesFrac*100) %successrate


% Task 5. Compute the "run with ball" distance of specified players
fprintf('\n4. Compute the "run with ball" distance of specified players \n')
players = {'Toni Kroos', 'Philipp Lahm'}; % test data
% Display the name and the total "run with ball" distance of each player,
%   one line for each player.  Your code should work for any number of 
%   valid player names in the variable players above. I.e., your code 
%   should work for different test data.
%%%%
%%%% Write your code here  %%%%
%%%%
size = size(players); %get size of players and put into variable size
[playersTotalD, posCellArray] = computeDistance(players, eventData); %run computeDistance
for k = 1:size(1,2) %iterate through all specified players
    fprintf('%s: %f meters \n', players{1,k}, playersTotalD{1,k}) %run fprintf

end

clear %to allow for successive runs, clear varibables/workspace.

%% Use STRUCT ARRAY to house the shots data

% Task 6a. Read data from file and store it in a struct array
%%%%
%%%% Write your code here so that the fprintf below can be uncommented %%%%
%%%%
% fprintf('\nNow using struct array.  There are %d shots in total\n', nS) 

% Task 6b. What is the probability of scoring when a player shoots a
% certain distance range from the gate?
minR = 35;
maxR = 45;
%% Use STRUCT ARRAY to house the shots data
 
% Task 6a. Read data from file and store it in a struct array
nS = shotDataInStructArray();
 fprintf('\nNow using struct array.  There are %d shots in total\n', nS) 
 
% Task 6b. What is the probability of scoring when a player shoots a
% certain distance range from the gate?
minR = 35;
maxR = 45;

probability = computeShotProb(minR, maxR);
 fprintf('\n6. There is a %.1f%% chance of scoring a goal when shooting from %d to %d meters\n',...
     prob*100, minR, maxR);

 % fprintf('\n6. There is a %.1f%% chance of scoring a goal when shooting from %d to %d meters\n',...
%     prob*100, minR, maxR)

