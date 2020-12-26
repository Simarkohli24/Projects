  
fileID = fopen('germany-vs-argentina-players.txt');
    l = parseStr(fgetl(fileID));
    a = size(l);
    k = 0;
    while ~(a(1,2) == 1)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
        l = parseStr(fgetl(fileID));
        a = size(l);
        if ~(a(1,2) == 1)
            k = k + 1;
            for j = 1:a(1,2)
                playerData{k,j} = l{1,j};
            end
        end
    end
    xSize = 105; 
    ySize = 68;

eventData = eventDataInCellArray(playerData, xSize, ySize);
disp(eventData);
   
[winPossessionTeam, possessionData] = eventAnalysis(eventData, xSize);
disp(possessionData);
disp(winPossessionTeam);