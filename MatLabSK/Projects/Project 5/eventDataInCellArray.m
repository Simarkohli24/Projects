function eventData = eventDataInCellArray(playerData, xSize, ySize)
    fileID = fopen('germany-vs-argentina.txt'); %open file to be read
    l = parseStr(fgetl(fileID)); %parse file
    v = size(l); %store size of lines
    k = 0; %initalize k
    while ~(v(1,2) == 1) %while v(1,2) is not equal to 1
        l = parseStr(fgetl(fileID)); %parse string 
        v = size(l); %store size and update
        if ~(v(1,2) == 1) %as long as file has not completely been parsed (resulting in a value of 1)
            k = k + 1; %add to 1 to k
            for j = 1:v(1,2) %iterate for size
                eventData{k,j} = l{1, j}; %store each field of line into array
            end
        end
    end
    maxval = size(eventData); %store eventData's size
    maxval2 = size(playerData); %store playerData's size
    for k = 1:maxval(1,1) %iterate for rows
        for l = 3:4 %store 3rd and 4th fields as type double
            eventData{k,l} = (str2double(eventData{k,l}));
        end
        
        for m = 5:8 %adjust for x and y sizes
            if rem(m,2) == 1 %5,7 and 6,8
                eventData{k,m} = (str2double(eventData{k,m})/100*xSize); %scale to normal xSize
            else
                eventData{k,m} = (str2double(eventData{k,m})/100*ySize); %scale to normal ySize
            end
        end
        
        eventData{k,10} = str2double(eventData{k,10}); %change 10th field into double as well
        
        for j = 1:maxval2(1,1)
            if (strcmp(eventData{k,1}, playerData{j,1}) == 1) %if eventData id matches playerData id
                eventData{k,1} = playerData{j,2}; %store name of player
            end
        end
    end
end


