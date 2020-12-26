function [winPossessionTeam, possessionData] = eventAnalysis(eventData, xSize)
    v = size(eventData); %store size of eventData
    AR = 0; %initalize AR and DE variables (possession)
    DE = 0;
    for k = 1:45 %iterate for number of minutes
        for l = 1:v(1,1) %iterate for row (number of events)
            if (eventData{l,3} == k) %analyze per minute
                if (eventData{l,5} > (xSize/2)) %check to see where the ball is
                    AR = AR + 1; %if argentina, add one to argentina tracker
                else
                    DE = DE + 1; %if germany, add one to germany tracker
                end
            end
        end
        if DE > AR %compare which one was greater and store that team's name as possessionData
            possessionData{1,k} = 'DE';
        else
            possessionData{1,k} = 'AR';
        end
        AR = 0; %reset AR and DE for next minute's analysis
        DE = 0;
    end
    w = size(possessionData); %store size of possessionData 
    for k = 1:w(1,2) %iterate for number of cells 
        if (strcmp('DE', possessionData{1,k}) == 1) %if DE possessed ball for that minute, then add to DE
            DE = DE + 1; %add one to DE
        else
            AR = AR + 1; %otherwise add one to argentina
        end
    end
    if DE > AR %which ever team has a higher possession number get's stored in winPOssessionTeam
        winPossessionTeam = 'DE'; %germany possessed more
    else
        winPossessionTeam = 'AR'; %argentina possessed more
    end
end

