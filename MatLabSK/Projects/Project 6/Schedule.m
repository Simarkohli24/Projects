classdef Schedule < handle
% A schedule has an IntervalTime window in which events can be scheduled 
% and a cell array of Events.
    
properties (SetAccess = private)
        sname= '';       % The name of the schedule
        window= IntervalTime.empty(); % The IntervalTime in which events 
                                      % can be scheduled
        eventArray= {};  % The cell array of events
        fraction= 0.5;   % The fraction (weight) placed on the importance
                         % of an event for computing a scheduling score, 
                         % which is used to rank events when multiple 
                         % events can be scheduled at the same time.  
    end
    
    methods
        function s = Schedule(startTime, endTime, scheduleName)
        % Construct schedule s.  
        % s.window goes from startTime to endTime, each is a char vector
        %   indicating a time, e.g., '08:00 am'.
        % s.sname is assigned scheduleName (char vector), the title to be 
        %   shown on the schedule graphic.
        % s.eventArray starts as an empty cell array.
        % s.fraction gets the default value 0.5.
            %%%% Write your code below %%%%
            % number of arguments passed is greater than or equal to 2
            if (nargin >= 2)
                %establish window as said intervaltime
                s.window = IntervalTime(startTime, endTime);
            end
            %number of arguments passed is equal to three
            if (nargin == 3)
                %set schedule name
                s.sname = scheduleName;
            end
            %initialize eventArray as empty and fraction at the specified
            %value
            s.eventArray = {};
            s.fraction = 0.5;
                
        end %constructor
        
        function addEvent(self, ev)
        % Adds Event ev to the end of self.eventArray
            %%%% Write your code below %%%%
            %set currentl as the length of eventArray
            currentl = length(self.eventArray);
            %index a new event using length + 1
            self.eventArray{currentl + 1} = ev;

        end
        
        function setFraction(self, f)
        % Assign to self.fraction the type double value f (assume 0<=f<=1)
            %%%% Write your code below %%%%
            %set self.fraction to the particular f value specified
            self.fraction = f;

        end
        
        function scheduledEvents = getScheduledEvents(self)
        % scheduledEvents is a cell array of all scheduled events in this 
        % schedule  
            %%%% Write your code below %%%%
            %find length of eventArray
            l = length(self.eventArray);
            %initialize counter at 1
            counter = 1;
            %start for loop through length
            for k = 1:l 
                %if an event is scheduled
                if isempty(self.eventArray{k}.scheduledTime) == 0
                    %index that event into a separate array titled
                    %scheduledEvents
                    scheduledEvents{counter} = self.eventArray{k};
                    %increase counter
                    counter = counter + 1;
                end
            end

        end %method getScheduledEvents   
        
        function extras = scheduleEvents(self)
        % Schedule events from self.eventArray in self.window.  First
        % unschedule all events.  Then use a heuristic to schedule events
        % as follows:
        % 1. Define a "remaining window," which is the window available for
        %    scheduling events.  Initialize the remaining window to be the 
        %    same as window (same left and reight ends).
        % 2. Find the earliest unscheduled event that can be scheduled in
        %    the remaining window.
        % 3. If multiple events have the same earliest time, choose the
        %    event with the highest score:
        %      score = f * importance + (1-f) * normalized_duration
        %    where normalized_duration = duration/total minutes within the 
        %    schedule window 
        % 4. If the chosen event is scheduled, update the remaining window.
        % 5. Repeat steps 2 to 4 until no events can be scheduled.
        % extras is a cell array of the Events (and Courses) that did not
        % get scheduled.  The length of extras is the number of events that
        % did not get scheduled.  If all events got scheduled then extras
        % is the empty cell array {}.
            %%%% Write your code below %%%%
            %initialize particular constants
            extras= {1};
            %get length of eventArray
            j = length(self.eventArray);
            %initialize remaining window
            remaining_window = self.window;
            %set earliesttime to inf to easily accept a new early value
            earliesttime = inf;
            %establish boolean values
            boolean = true; 
            boolean2 = true;
            boolean3 = true;
            %initialize counter
            counter = 1;
            %set f to self.fraction
            f = self.fraction;
            %earliestevent=self.eventArray{1};
            
            for k = 1:j 
                %run through the entirety of eventArray and unschedule
                %events
                self.eventArray{k}.unschedule(); 
            end
            %while the boolean is true
            while boolean == true
                %iterate through eventArray
                for k = 1:j
                    %make sure that the event's scheduled time is empty
                    if (isempty(self.eventArray{k}.scheduledTime) == 1) 
                        %if the particular event cannot fit in the
                        %remaining window
                        if (self.eventArray{k}.earliestTime...
                                (remaining_window) == inf)
                            %run through all events in extra to ensure that
                            %the event not able to fit isn't being coded
                            %again or repetitively
                            for l = 1:(length(extras))
                                %if the event is found among extras
                                %pre-existing events, then boolean2 is set
                                %to false
                                if (extras{l} == self.eventArray{k})
                                    boolean2 = false;
                                end
                            end
                            %only if the event not able to fit doesn't
                            %already exist in extras, will it be added to
                            %extras and indexed using counter. Otherwise,
                            %boolean2 is false from above preventing
                            %indexing of event
                            if boolean2 == true
                                boolean3 = false;
                                extras{counter} = self.eventArray{k};
                                counter = counter + 1;
                            end
                            %reset boolean2 to ensure next round of
                            %iterations can be executed properly
                            boolean2 = true;
                        else
                            %if the eventArray's earliest time has beaten a
                            %record earliest time, then set the new
                            %earliest time and new earliestevent to that
                            %event's earliest time and event
                            if (self.eventArray{k}.earliestTime...
                                    (remaining_window) < earliesttime)
                                earliesttime = self.eventArray{k}...
                                    .earliestTime(remaining_window); 
                                earliestevent = self.eventArray{k};
                            %if the event has the same earliest time as
                            %the record earliest time, then analyze the
                            %normalized durations (heuristic) and input it
                            %into given score equations.
                            elseif (self.eventArray{k}.earliestTime...
                                    (remaining_window) == earliesttime)
                                
                                normalized_duration1 = (self.eventArray...
                                    {k}.duration)/self.window.getWidth();
                                normalized_duration2 = (earliestevent...
                                    .duration/self.window.getWidth());
                               
                                score1 = f*self.eventArray{k}.importance...
                                    + (1-f)*normalized_duration1; 
                                score2 = f*earliestevent.importance...
                                    + (1-f)*normalized_duration2;
                                
                                %if score of new event is greater than
                                %score of pre-existing event, set earliest
                                %event and earliest time to that event
                                if score1 > score2 
                                    earliestevent = self.eventArray{k}; 
                                    earliesttime = self.eventArray{k}...
                                        .earliestTime(remaining_window);
                                end
                                
                            end 
                        end
                    end
                end
                %after iterating throughout the entire set of events, set
                %the earliest event found and schedule it to its earliest
                %time
                earliestevent.setScheduledTime(earliesttime)
                %however, if earliesttime, for whatever reason, is set to
                %infinity, do not allow it to update the remaining window.
                %else, any actual value is then used to update remaining
                %window
                if ~(earliesttime == inf)
                        remaining_window = IntervalTime(earliesttime...
                            + earliestevent.duration,...
                            remaining_window.rightTime.timeInMins);
                end
                %once the length of extras equals the length 
                if (length(extras)...
                        + length(self.getScheduledEvents()) == j)
                    %terminate while
                   boolean = false; 
                else
                    %reset earliesttime for next iteration
                   earliesttime = inf;
                end
            end
            %if boolean3 is still true, which means there was no class that
            %failed to be scheduled, then set extras to empty, since we
            %initialized extras as having a first cell of 1
            if boolean3 == true
               extras = {};
            end
        end %method scheduleEvents
        
        function draw(self)
        % Draws the scedule and all the events.  This method sets up the 
        % figure window, shows the title (self.sname), labels the axes, and 
        % draws each event.  Figure window should be made full screen, 
        % ticks on the y-axis should only be drawn at integer (id) values 
        % and the axes should enclose only the scheduling window in the 
        % x-direction and only the range of event ids in the y-direction.

            figure('units','normalized','outerposition',[0 .05 1 .95],...
                   'name', 'Schedule')
            hold on
            title(self.sname);
            xlabel('Time');
            ylabel('Event ID');
            
            minId = inf;
            maxId = -inf;
            
            % Call the draw method on each event
            for i = 1 : length(self.eventArray)
                self.eventArray{i}.draw();
                if (self.eventArray{i}.getId() > maxId)
                    maxId = self.eventArray{i}.getId();
                end
                if (self.eventArray{i}.getId() < minId)
                    minId = self.eventArray{i}.getId();
                end
            end
            
            % Set nice tick values and axes
            if (~isempty(self.eventArray))
                % Get x-axis limits
                xmin = self.window.leftTime.timeInMins;
                xmax = self.window.rightTime.timeInMins;
                % Set y tick marks
                set(gca, 'ytick', minId:maxId) 
                % Set x-axis and y-axis limits
                axis([xmin, xmax, minId-1, maxId+1]); 
                % Compute 11 tick marks and labels to display on the 
                % x-axis--convert from minutes to the text representation 
                % of time
                numFractions= 11;
                ax = gca;
                xTickArray = zeros(1,numFractions);
                xTickLabel = cell(1,numFractions);
                index = 1;
                for i = self.window.leftTime.timeInMins : ...
                        self.window.getWidth()/(numFractions-1) : ...
                        self.window.rightTime.timeInMins
                    xTickArray(index) = i;
                    xTickLabel{index} = Time(i).getTimeAsText();
                    index = index+1;
                end
                ax.XTick = xTickArray;
                ax.XTickLabel = xTickLabel;               
            end
            hold off
        end %method draw
    end %methods
    
end

