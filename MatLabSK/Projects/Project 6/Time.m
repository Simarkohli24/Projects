classdef Time < handle
% A Time has a numeric value timeInMins which is the number of minutes 
% from 00:00 am of the same day.  E.g., timeInMins is 120 for 02:00 am.
% Note:  Noon is 12:00 pm, midnight is 00:00 am
    
    properties
        timeInMins = 0; 
    end %public properties
    
    methods
        function t = Time(time)
        % Constructor:  construct a Time object
        % time is either a char row vector specifying a time in the format
        % "hh:mm ?m", where ? is either 'a' or 'p', or a type double
        % non-negative integer indicating minutes.
            if nargin==1
                %check the argument type
                if ischar(time)
                    t.timeInMins = t.convertTextToMins(time);
                else
                    t.timeInMins = time;
                end    
                
            end
        end
        
        function m = convertTextToMins(self,timeText)
        % Return the total minutes of a time given in text format.    
        % timeText is a char vector with the format "hh:mm ?m" where ? is  
        %   'a' or 'p'.  E.g., timeText can be '02:00 pm'
        % m is the total minutes from 00:00 am to timeText
            %%%% Write your code below %%%%
            m = []; %initialize m
            hours = timeText(1:2); %obtain values in hours, values in 
            minutes = timeText(4:5); %minutes, and convert them into doubles
            convhours = str2double(hours);
            convminutes = str2double(minutes);
            time = 60*convhours + convminutes; %calculate a tentative time
            %code for cases where 12:?? pm is coded (prevent redundant
            %doubling
            if (strcmp(timeText(7), 'p') && (strcmp(timeText(1:2),'12') ...
                    == 0)) || (strcmp(timeText, '12:00 am') == 1)
                %add 720 if time is in pm
                m = time + 720; 
            else
                %just set time equal to the time calculated if in am
                m = time; 
            end
        end
        
        function tf = isEarlierThan(self, other)
        % tf is true if self is earlier than the other Time; otherise tf is
        % false.
            %%%% Write your code below %%%%
            %compare time in mins of self and other 
            if self.timeInMins < other.timeInMins
                tf = true; %if earlier than, set tf to true
            else
                tf = false; %if not, set tf to false
            end
            
        end
        
        function t = getTimeAsText(self)
        % Return the text (a char row vector) corresponding to this Time.    
        % t is a char row vector with the format "hh:mm ?m" where ? is 'a'
        %   or 'p'.  E.g., if this Time's timeInMins property is 120, then 
        %   t is '02:00 am'   
            %%%% Write your code below %%%%
            t= ''; %initialization
            if self.timeInMins <= 720 %if time is am
                %run conversions of minutes hours (double) to minutes hours
                %(char)
                minutes = rem(self.timeInMins, 60);
                hours = (self.timeInMins - minutes)/60; 
                sminutes = num2str(minutes, '%0.2d\n'); 
                shours = num2str(hours, '%0.2d\n'); 
                %code for anomaly of 12:00 pm
                if hours == 12
                    t = '12:00 pm';
                else
                    %concatenate shours and sminutes for time
                    t = [shours ':' sminutes ' am'];
                end
            else
                %create variable working time to figure eliminate the am pm
                %variable of calculating time (aka, removing an
                %artificially added 720 minutes)
                workingtime = self.timeInMins - 720; 
                %conduct rem function on working time to figure out the
                %number of hours, minutes
                minutes = rem(workingtime, 60); 
                hours = (workingtime - minutes)/60; 
                sminutes = num2str(minutes, '%0.2d\n');
                shours = num2str(hours, '%0.2d\n');
                if hours == 0 
                    %concatenate minutes with 12 (anomaly)
                    t = ['12' ':' sminutes ' pm'];
                elseif hours == 12
                    %code for another anomaly
                    t = '12:00 am';
                else
                    %concatenate the times calculated
                    t = [shours ':' sminutes ' pm'];
                end
            end
        end 
    end %public methods   
end %class Time   