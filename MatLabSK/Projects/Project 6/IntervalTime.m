classdef IntervalTime < handle
% An IntervalTime is a time window from leftTime to rightTime, i.e.,
% leftTime is no later than rightTime; leftTime and rightTime are each a 
% Time object.
    
    properties
       leftTime = Time.empty(); 
       rightTime = Time.empty(); 
    end
    
    methods
        function self = IntervalTime(lt, rt)
        % Constructor:  construct an IntervalTime object
        % lt, rt: represent the two ends of the time window. The
        % IntervalTime is to be constructed such that leftTime is no
        % later than rightTime. lt, rt have the same type, which can be
        %   - handle to a Time object 
        %   - char row vector specifying a time in the format "hh:mm ?m"
        %   - type double non-negative integer indicating minutes
            %%%% Write your code below %%%%
            if nargin == 2 %make sure both lt and rt have been specified
                
                if (isa(lt, 'Time') == 0) %convert to Time using constructor
                    lt = Time(lt); %turn lt and rt into proper time objects
                    rt = Time(rt);
                end

                if (lt.isEarlierThan(rt) == 0) %if lt > rt, correct for error
                    a = lt; %manipulate lt and rt to shift the values 
                    b = rt; %(by swapping values 
                    lt = b; 
                    rt = a;
                end

                self.leftTime = lt; %set left time of interval
                self.rightTime = rt; %set right time of interval
            end
        end
        
        function w = getWidth(self)
        % Return the width of the IntervalTime in minutes            
            %%%% Write your code below %%%%
            w = [];
            %get the right time in minutes
            right = self.rightTime.timeInMins; 
            %get the left time in minutes
            left = self.leftTime.timeInMins;
            %subtract times to get width
            w = right - left;
        end
        
        function scale(self, f)
        % Scale self by a factor f
            %%%% Write your code below %%%%
            %multiple with by scale factor
            r = self.getWidth*f;
            %create new right time that is left time + the width
            self.rightTime = Time(self.leftTime.timeInMins + r);
        end
        
        function shift(self, s)
        % Shift self by s
            %%%% Write your code below %%%%
            %add the s value to the left times and right times and
            %establish new self(intervaltime)
            self.leftTime = Time(self.leftTime.timeInMins + s);
            self.rightTime = Time(self.rightTime.timeInMins + s);
        end
        
        function tf = isIn(self, other)
        % tf is true if self is in the other IntervalTime
            %%%% Write your code below %%%%
            %initialize to false
            tf= false;
            %check to see if the left and right bounds of self are within
            %the other interval (essentially, the self's left is greater
            %than other's left, and self's right is greater than other's
            %right
            if (self.leftTime.timeInMins >= other.leftTime.timeInMins) && ...
               (self.rightTime.timeInMins <= other.rightTime.timeInMins)
                tf = true;
            else
                %if above check isn't passed, set tf to false (precaution)
                tf = false;
            end
        end
        
        function Inter = add(self, other)
        % Inter is the new IntervalTime formed by adding self and the 
        % the other IntervalTime
            %%%% Write your code below %%%%
            %Initialize
            Inter= IntervalTime.empty();
            %add self's and other's left times and self's and other's right
            %times and create new interval with those sums
            left = self.leftTime.timeInMins + other.leftTime.timeInMins;
            right = self.rightTime.timeInMins + other.rightTime.timeInMins; 
            Inter = IntervalTime(left, right);
        end
        
        function Inter = overlap(self, other)
        % If self and the other IntervalTime overlap, then Inter is the
        % overlapped IntervalTime; otherwise Inter is empty.            
            %%%% Write your code below %%%%
            %Initialize the interval
            Inter= IntervalTime.empty();
            %check to see if right time is within other's interval, and the
            %left time is outside, or the left time is within other's
            %interval, and the right time is outside, or vice versa, and
            %compute the interval using min and max for left times and
            %right times (respectively)
            if (self.rightTime.timeInMins >= other.leftTime.timeInMins &&...
                    self.leftTime.timeInMins <= other.rightTime.timeInMins)...
                    || (other.rightTime.timeInMins >= ...
                    self.leftTime.timeInMins) && (self.rightTime.timeInMins...
                    >= other.leftTime.timeInMins)
                right = min(other.rightTime.timeInMins,...
                    self.rightTime.timeInMins);
                left = max(other.leftTime.timeInMins,...
                    self.leftTime.timeInMins);
                Inter = IntervalTime(left,right);
            else
                %otherwise have inter be empty
                Inter = IntervalTime.empty();
            end
        end
        
        
        function disp(self)
        % Display self, if not empty, in this format: [hh:mm ?m, hh:mm ?pm]
        %   E.g., [11:30 am, 02:00 pm]
        % If empty, display 'Empty <classname>'
            if isempty(self)
                fprintf('Empty %s\n', class(self))
            elseif length(self)>1
                disp@handle(self)  % use MATLAB's default display
            else
                fprintf('[%s, %s]\n', self.leftTime.getTimeAsText(), ...
                                      self.rightTime.getTimeAsText())
            end
        end
        
    end %methods
    
end %classdef