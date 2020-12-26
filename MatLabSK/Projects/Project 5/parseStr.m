function dataCellArray = parseStr(s)
    counter = 0; %initalize counter
    iinitial = 1; %initalize iinitial
    for i = 1:length(s) %iterate till the end of string
        if s(i) == ','|| i == length(s) %if comma come across, create one field of previous characters and if reached end, create last field
            if ~(i == length(s)) %as long as parser hasn't reached end of line
                counter = counter + 1; %add to counter
                dataCellArray{counter} = s(iinitial:i-1); %store values into dataCellArray
                iinitial = i+1; %add 1 to iinitial
            end
            if i == length(s) %if parser reached the end
                counter = counter + 1; %add one to counter
                dataCellArray{counter} = s(iinitial:length(s)); %store last field
            end
        end
    end
end

