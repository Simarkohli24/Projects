function [numScheduledEvents, totalMinsScheduled] = analyzeSchedule(s) 
%The following function analyzes a schedule (s) by manipulating the value
%of fraction between 0 to 1 by increments of .1. The program then schedules
%the events each time, recording the number of total scheduled events and
%the toal number of minutes scheduled (which are length 11 vectors). The
%function then outputs to graphs, 1) numScheduledEvents vs Fraction and 2)
%totalMinsScheduled vs Fraction.

    %initalize totalMinsScheduled as a vector of zeros
    totalMinsScheduled = zeros(1,11);
    numScheduledEvents = zeros(1,11);
    %iterate from 1-11
    for k = 1:11
        %calculate the proper increments using (k-1)/10 for fraction
        s.setFraction((k-1)/10)
        %schedule events with the new fraction
        s.scheduleEvents;
        %create new array of all scheduled events
        array = s.getScheduledEvents;
        %get length of the new array to determine the number of scheduled
        %events for that particular k value
        numScheduledEvents(k) = length(array);
        %iterate for the number of scheduled events
        for l = 1:length(s.getScheduledEvents)
            %calculate the total mins scheduled for each increment and
            %establish it into the totalMinsScheduled at its proper index
            totalMinsScheduled(k) = totalMinsScheduled(k) + array{l}.duration;
        end
    end
    %create figure
    figure; 
    %hold on 
    hold on
    %plot 
    plot([0:0.1:1], numScheduledEvents, '-b')
    hold off
    %create title, xlabel, and ylabel
    title('Number of events scheduled vs. fraction')
    xlabel('Number of events scheduled')
    ylabel('Fraction')
    %create second figure
    figure; 
    %hold on
    hold on
    %plot
    plot([0:0.1:1], totalMinsScheduled, '-r')
    hold off
    %create title, xlabel, and ylabel
    title('Number of minutes scheduled vs. fraction')
    xlabel('Number of minutes scheduled')
    ylabel('Fraction')
end
    