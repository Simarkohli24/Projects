function [s, extras] = createSchedule( dataFilename, scheduleStart, ...
                                       scheduleFinish )
%Creates a schedule based on the events data in a text file.
%   dataFilename is a char row vector that names the text data file.
%   Instantiate a Schedule object with a window from scheduleStart to 
%     scheduleFinish, where scheduleStart and scheduleFinish are each a 
%     char vector representing a time (e.g., '02:00 am') and scheduleStart 
%     is earlier than scheduleFinish.
%   All events in dataFilename are added to the eventArray of the schedule.     
%   The events are then scheduled using the heuristic given in class 
%   Schedule and the schedule is drawn.
%   dataFilename is the name of a file encoding data for all events to add
%     to the newly created schedule. Events are encoded in a given line L 
%     as follows:  id = L(3:6), startAvailable = L(8:15), 
%     endAvailable= L(17:24), duration = L(26:29), and 
%     importance = L(30:36).  L(1) is 'e' if the line represents a basic 
%     Event, while L(1) is 'c' if it is a Course.  If the event is a
%     course, L(38:end) encodes the name of the course.
%   s is the handle of the Schedule object after scheduling.
%   extras is a cell array of the events that did not get scheduled.

% Open the appropriate file
eventDataFile = fopen(dataFilename);

% Instantiate a Schedule object (no event is scheduled yet)
s = Schedule(scheduleStart, scheduleFinish, 'My Schedule');

% Read data from file and add the Event (or Course) to s.eventArray
%%%% Write your code below %%%%
%initalize a to zero
a = 0;
%while a does not equal 1, which happens when fgetl(eventDataFile) parses
%the blank line after the last line in the text file
while ~(a == -1)
    %parse the file
    a = fgetl(eventDataFile);
    %if c is found in the beginning of the file
    if (strcmp(a(1), 'c'))
        %create a course with the proper specifications of start, end, id,
        %name, duration, and importance
        %once again, confirm that a doesn't equal -1
        if ~(a == -1)  
        m = Course(a(8:15), a(17:24), str2double(a(26:29)),...
           str2double(a(30:36)), str2double(a(3:6)), (a(38:length(a))));
       %add the event
        s.addEvent(m)
        end
        %otherwise it's an event!
    else  
        %as long as a doesn't equal -1 and hasn't reached the end of the
        %file
        if ~(a == -1)
            %create event based off of specifications in file
           m = Event(a(8:15), a(17:24), str2double(a(26:29)), ...
               str2double(a(31:36)), str2double(a(3:6)));
            %add the event
           s.addEvent(m);
        end
    end
end


% Close the data file
fclose(eventDataFile);

% Schedule the events
%%%% Write your code below %%%%

extras = s.scheduleEvents();

% Draw the schedule
%%%% Write your code below %%%%
s.draw()