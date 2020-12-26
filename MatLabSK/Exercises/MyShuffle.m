% function [c, sd] = MyShuffle(d)
%     c = ceil(23*rand()) + 15; 
%     counterdeck = 1; 
%     counterBot = 1;
%     counterAlt = 1;
%     while counterdeck <= c
%         Top{counterdeck} = d{counterdeck}; 
%         counterdeck = counterdeck + 1; 
%     end
%     while counterdeck <= length(d)
%         Bot{counterBot} = d{counterdeck}; 
%         counterBot = counterBot + 1;
%         counterdeck = counterdeck + 1;
%     end
%     if c <= length(d)/2
%         while counterAlt <= length(Top)
%             sd{2*counterAlt - 1} = Top{counterAlt};
%             sd{2*counterAlt} = Bot{counterAlt}; 
%             counterAlt = counterAlt + 1;
%         end
%         while counterAlt <= length(d)
%             sd{counterAlt} = Bot{counterAlt};
%             counterAlt = counterAlt + 1;
%         end
%     else
%         while counterAlt <= length(Bot)
%             sd{2*counterAlt - 1} = Top{counterAlt};
%             sd{2*counterAlt} = Bot{counterAlt}; 
%             counterAlt = counterAlt + 1;
%         end
%         while counterAlt <= length(d)
%             sd{counterAlt} = Top{counterAlt};
%             counterAlt = counterAlt + 1;
%         end
%     end
% end

n = length(S); 
c = ceil(23*rand()) + 15; 
T = cell(1,n);  Top=cell(1,c);  Bot= cell(1,length(S)-c);
% Cut the deck
for k= 1:c
    Top{k}= S{k};
    Bot{k}= S{c+k};
end

% Alternate
if (c <= n/2)
    for k= 1:c
        T{2*k-1} = Top{k};
        T{2*k}   = Bot{k};
    end
    for k = c+1:n
        T{k} = Bot{k}; 
    end
else
    for k= 1:c
        T{2*k-1} = Top{k};
        T{2*k}   = Bot{k};
    end
    for k = c+1:n
        T{k} = Top{k}; 
    end
end

    

    