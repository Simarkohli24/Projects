function playerData = playerDataInCellArray()
    fileID = fopen('germany-vs-argentina-players.txt'); %open file
    l = parseStr(fgetl(fileID)); %parse file and eliminate the first line (by already having parsed it)
    a = size(l); %get size of individual line
    k = 0; %initalize k
    while ~(a(1,2) == 1) %while parse doesn't reach the end of the lines (where output becomes 1)
        l = parseStr(fgetl(fileID)); %parse data
        a = size(l); %update size/a value
        if ~(a(1,2) == 1) %as long as parse hasn't reached the end
            k = k + 1; %add to 1 to k
            for j = 1:a(1,2) %iterate
                playerData{k,j} = l{1,j}; %store values in playerData{k,j}
            end
        end
    end
end

