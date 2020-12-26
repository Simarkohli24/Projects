function [playersTotalD, posCellArray] = computeDistance(players, eventData)
v = size(eventData); %v is the size of eventData
w = size(players); %w is the size of players
totaldistance = 0; %initalize totaldistance at 0
counter = 2; %counter is at 2 since posCellArray{j}{1} is player name
for j = 1:w(1,2) 
    posCellArray{j}{1} = players{j}; %put in player name for posCellArray{j}{1}
    for k = 1:v(1,1) 
        distance = 0; %initalize distance and reset the value after every run
        if (strcmp(eventData{k,1}, players{1,j}) == 1) && (eventData{k,10} == 101) %if player name and 101 (indicating run) found in parsing data then
            distance = sqrt((abs(eventData{k,5} - eventData{k,7}))^2) + ((abs(eventData{k,6} - eventData{k,8}))^2); %calculate distance
            for l = 5:8
                posCellArray{j}{counter} = eventData{k,l}; %store values of x,y in posCellArray per player {j}
                counter = counter + 1; %use counter as a means of adding on to the cell array
            end
            totaldistance = distance + totaldistance; %successively add up distances for total distance
        end
    end
    playersTotalD{1,j} = totaldistance; %store totaldistance in playersTotal
    totaldistance = 0; %reset totalDistance for next player
end

            