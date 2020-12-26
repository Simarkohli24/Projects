function [entriesFrac, attempts] = attemptToBox(team, eventData) 
    v = size(eventData); %get size of eventData
    counter = 0; %initalize counter and success 
    success = 0;
    if(strcmp(team, 'DE') == 1) %check which team is being analyzed and set a variable team 
        team = 'Germany';       %to that name so that data can be parsed
        color = 'b';
    end
    if (strcmp(team, 'AR') == 1)
        team = 'Argentina';
        color = 'y';
    end
    
    for k = 1:v(1,1) %iterate for size of eventData (length/rows)
        if (eventData{k,10} == 101) || (eventData{k,10} == 1) %if event is either a pass or a run with ball
            if (strcmp(eventData{k,11}, team) == 1) %if event matches team
                if (strcmp('Germany',team) == 1) %if team is germany
                    if ~((eventData{k,5} >= 88.5) && (eventData{k,6} > 13.84) && (eventData{k,6} > 54.16)) && ((eventData{k,7} >= 88.5) && (eventData{k,8} > 13.84)) %first point must be outside of box and second point must be inside && (eventData{k,8} < 54.16)
                        counter = counter + 1; %add to counter
                        attempts{counter, 1} = eventData{k,1}; %create cell array
                        attempts{counter, 2} = eventData{k,5}; 
                        attempts{counter, 3} = eventData{k,6};
                        attempts{counter, 4} = eventData{k,7};
                        attempts{counter, 5} = eventData{k,8}; 
                        attempts{counter, 6} = str2double(eventData{k,2}); %convert to double to analyze
                        if attempts{counter,6} == 1 %if success
                            success = success + 1; %add one to success 
                            DrawArrow( [eventData{k,5} eventData{k,6}], [eventData{k,7} eventData{k,8}], 'color', color); %draw success arrow
                        else
                            DrawArrow( [eventData{k,5} eventData{k,6}], [eventData{k,7} eventData{k,8}], 'color', 'w'); %otherwise draw failure arrow
                        end
                    end
                end
                if (strcmp('Argentina',team) == 1) %if argentina
                    if ~((eventData{k,5} <= 16.5) && (eventData{k,6} > 13.84) && (eventData{k,6} < 54.16)) && ((eventData{k,7} <= 16.5) && (eventData{k,8} > 13.84) && (eventData{k,8} < 54.16)) %points must be outside and then inside box
                        counter = counter + 1; %add to counter
                        attempts{counter, 1} = eventData{k,1}; %create cell array
                        attempts{counter, 2} = eventData{k,5}; 
                        attempts{counter, 3} = eventData{k,6};
                        attempts{counter, 4} = eventData{k,7};
                        attempts{counter, 5} = eventData{k,8}; 
                        attempts{counter, 6} = str2double(eventData{k,2}); 
                        if attempts{counter,6} == 1 %if successful
                            success = success + 1; %add to success
                            DrawArrow( [eventData{k,5} eventData{k,6}], [eventData{k,7} eventData{k,8}], 'color', color); %draw success arrow
                        else
                            DrawArrow( [eventData{k,5} eventData{k,6}], [eventData{k,7} eventData{k,8}], 'color', 'w'); %otherwise draw failure arrow
                        end
                    end
                end
            end
        end
    end
entriesFrac = success/counter; %calculate success rate
end

    
                
                    
                
    