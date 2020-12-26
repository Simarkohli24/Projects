classdef Course < Event
% A course is a subclass of Event that includes a char vector courseName
    
    properties(Access = private)
        courseName='';  % The name of the course
    end
    
    methods
        function c = Course(openTime, closeTime, duration, importance, ...
                            id, name)
            % Construct course c. The inherited properties are set by
            % calling Event's contructor.  c.courseName is set to name.
            if (nargin<5)
               openTime= 0;
               closeTime= 0;
               duration= 0;
               importance= 0;
               id= -1;
            end
            c = c@Event(openTime, closeTime, duration, importance, id);
            if (nargin == 6)
                c.courseName = name;
            end
        end
        
        function n = getCourseName(self)
        % Returns the private access courseName
            %%%% Write your code below %%%%
            n= '';
            %set n (the output) to the course's name
            n = self.courseName;
        end
        
        function draw(self)
        % Overwrites Event's draw method. Calls Event's draw method, then
        % also draws the course name as text in the center of the event if 
        % it's scheduled.
            %%%% Write your code below %%%%
            %overwrite Event's draw method
            draw@Event(self);
            
            %if self has a scheduled time
            if (isempty(self.scheduledTime) == 0)
                %set xcoordinate and ycoordinate to the following:
                xcoordinate = self.duration/2 + Time(self.scheduledTime).timeInMins;
                ycoordinate = self.getId(); 
                %call text with the above defined variables.
                text(xcoordinate, ycoordinate, self.getCourseName(),...
                 'HorizontalAlignment', 'center');
            end
                
        end
    end %methods
    
end

