classdef Event < handle
% An event has an id, an IntervalTime in which it can be scheduled, a 
% duration, a real value between 0 and 1 representing its importance, and a 
% Time object representing when it's scheduled.
    
    properties(Access = private)
        id              % Unique id 
    end %private properties
    
    properties
        available = IntervalTime.empty();  % The time window within which 
                                           % the event can be scheduled 
        duration     % Length of the event in minutes
        importance   % Importance, a real value between 0 and 1
        scheduledTime = Time.empty();  % Scheduled start time; empty object 
                                       % if unscheduled
    end %public properties
    
    methods
        function e = Event(availableStart, availableFinish, duration, ...
                           importance, id)
        % Construct event e.  
        % e.scheduledTime is initialzed to an empty Time object.
        % availableStart and availableFinish are the left and right bounds
        %   of the available window, each is a char vector with the format 
        %   'hh:mm ?m' where ? is 'a' or 'p'. 
        % The other properties are assigned as given in the input parameters.
            
            % Only set properties to arguments if all 5 arguments are given
            if (nargin == 5)
                e.duration= duration;
                e.available= IntervalTime(availableStart, availableFinish);
                e.importance= importance;
                e.id= id;
            else 
                e.duration= 0;
                e.available= IntervalTime();
                e.importance= 0;
                e.id = -1;
            end
            % Scheduled time always initialized to an empty object
            e.scheduledTime = Time.empty();  
              % Included for completeness.  Not necessary since default
              % assignment is given in the Properties block above.
        end
        
        function t = earliestTime(self, possibleInterval)
        % t is the earliest time in minutes (type double) that self can be 
        % scheduled in the given possibleInterval.  possibleInterval is an 
        % IntervalTime handle.  If self cannot be scheduled in 
        % possibleInterval, then t is inf.
            
            % Determine if the event can be scheduled by checking if the
            % intersection of the available and possible IntervalTimes, if 
            % any, is greater than or equal to the event's duration.

            %%%% Write your code below %%%%
            %initialize t
            t= 0;
            %get the overlap of self and possible interval
            x = self.available.overlap(possibleInterval);
            %check to see if an overlap was found
            if (isempty(x) == 0)
                %given an overlap was found, compare the overlap's width to
                %the duration of self
                compare = x.getWidth();
                %if the compare is greater than self.duration, then that
                %means the class can be scheduled and fit into the possible
                %interval
                if (compare >= self.duration())
                    %set t to the left time of the overlap interval
                    t = x.leftTime.timeInMins; 
                else
                    %else set t to infinity
                    t = inf;
                end
            else 
                %else set t to infinity
                t = inf;
            end
        end
        
        function setScheduledTime(self, t)
        % Sets the time that self is scheduled for to t, i.e., set the
        % property scheduledTime.
        % t can be a double (total mins) or char vector ('hh:mm ?m')
            %%%% Write your code below %%%%
            %pretty self-explanatory: set self's scheduled time to t
        self.scheduledTime = t;
            
        end
        
        function unschedule(self)
        % Unschedules self (set scheduledTime to an empty object)
            %%%% Write your code below %%%%
            %pretty self-explanatory: set self's scheduled time to empty
        self.scheduledTime = Time.empty();

        end
        
        function id = getId(self)
        % Returns the private access id
            %%%% Write your code below %%%%
            %also pretty self-explanatory: set output id to self's id when
            %self is referenced
            id= [];
            id = self.id;
    
        end
        
        function draw(self)
        % Draws the event.  Up to two rectangles are drawn for a given
        % event.  First, a white rectangle is drawn (with black border)
        % representing the available window, using 
        % available.leftTime.timeInMins and available.rightTime.timeInMins
        % as the minimun and maximum x coordinates of the rectangle.  Then, 
        % if the event is scheduled, the time during which the event is 
        % scheduled is drawn as a colored rectangle, with the color being 
        % the linear interpolation from magenta to cyan based on the 
        % importance field:  cyan correponds to very important (1) while 
        % magenta corresponds to unimportant (0).  Both rectangles are 
        % centered on y=self.getId() and should have a height less than 1.
        % Assume that a figure window already is open and hold is on.
        % WRITE YOUR OWN CODE using built-in functions fill and plot to 
        % draw the rectangles.  DO NOT use the DrawRect function given in 
        % the past.
        
            bestColor = [0 1 1];   % Very important, cyan
            otherColor = [1 0 1];  % Unimportant, magenta
            %%%% Write your code below %%%%
            %get the importance of self and set as f
            f = self.importance;
            %set equation for linear interpolation
            colorused = (1-f)*otherColor + (f)*bestColor;
            %establish left available and right available as domain
            xleftava = self.available.leftTime.timeInMins;
            xrightava = self.available.rightTime.timeInMins;
            %establish y as the getId value
            y = self.getId();
            %draw a rectangle (white)
            fill([xleftava xrightava xrightava xleftava],...
                [(y-0.4) (y-0.4) (y+0.4) (y+0.4)], 'w')
            
            %if there is a scheduled time
            if isempty(self.scheduledTime) == 0 
                %set x domain using scheduledtime and duration
                left = Time(self.scheduledTime).timeInMins;
                right = left + self.duration; 
                %draw the rectangle using the linearly interpolated color
                fill([left right right left],...
                    [(y-0.4) (y-0.4) (y+0.4) (y+0.4)], colorused)
            end
            
        end
        
    end % public methods
    
end % class Event