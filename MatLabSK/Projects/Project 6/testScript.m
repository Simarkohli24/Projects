% testScript for Project 6 classes
% ADD YOUR TESTS to this file

close all

% Test class Time
t1= Time(120)           % Instantiate a Time with mins from 00:00 am.
m= t1.convertTextToMins('04:00 pm')  % Should be 960
t2= Time('03:00 pm')    % Instantiate an Time with time as char vector.
t2mins = t2.timeInMins  % Should be 900.  The property has the attribute 
                        % "public" so one can access timeInMins directly.
t1text= t1.getTimeAsText()  % Should be '02:00 am'
t3 = Time(500)
t4 = Time(1000)
t5 = Time('12:30 pm')
t3text = t3.getTimeAsText()
t4text = t4.getTimeAsText()
t5text = t5.getTimeAsText()

a= t1.isEarlierThan(t2) % Should be true, i.e., logical(1)
b= t2.isEarlierThan(t1) % Should be false, i.e., logical(0)

% Test class IntervalTime
 i1= IntervalTime(t1,t2)   % Instantiate an IntervalTime with Time arguments
 i2= IntervalTime('08:00 am','02:00 pm')  % Use char arguments 
 i3= IntervalTime(180,60)  % Use type double arguments, out of order.
 i4= IntervalTime(t2,t1)
 i5= IntervalTime('02:00 pm','08:00 am')
 i6= IntervalTime(60,180)
%                           % Should be [01:00 am, 03:00 am]
 i3w= i3.getWidth()                    % Should be 120                        
 i2LMins= i2.leftTime.timeInMins       % Should be 480
 i2LText= i2.leftTime.getTimeAsText()  % Should be '08:00 am'
 i3LText= i3.leftTime.getTimeAsText()  % Should be '01:00 am'
 i3LMins= i3.leftTime.timeInMins       % Should be 60
 i4RMins= i4.rightTime.timeInMins      % Should be 900 
 i4RText= i4.rightTime.getTimeAsText() % Should be '03:00 pm'
 
i1.scale(2); %scale by factor of 2
i3.scale(3); %scale by factor of 3
i4.scale(2); %scale by factor of 4
i5.scale(2); %scale by factor of 5
i6.scale(3); %scale by factor of 6

%in test
ia = IntervalTime('06:00 am', '11:00 am'); %create Intervals
ib = IntervalTime('08:00 am', '09:00 am');
ic = IntervalTime('11:59 am', '11:59 pm');
tf = isIn(ib, ia) %should be 1
tf = isIn(ia, ib) %should be 0

%shift test
ia.shift(60) %should now be an interval of '07:00 am' to '12:00 pm'
ib.shift(10) %should now be an interval of '08:10 am' to '09:10 am'
disp(ia)
disp(ib)

%getWidth test
iaW = ia.getWidth() %should be 300
ibW = ib.getWidth() %should be 60
icW = ic.getWidth() %should be 720

%add test 
ic = IntervalTime('01:00 am', '03:00 am'); %create intervals
id = IntervalTime('02:00 am', '04:00 am');
icd = IntervalTime(300, 500) 
idc = IntervalTime(600, 800)
addoutput = add(ic, id); %should be [03:00 am, 07:00 am]
addoutput2 = add(icd, idc); %should be [03:00 pm, 09:40 pm]


imm = IntervalTime('12:00 pm','03:00 pm') 
o2= i2.overlap(imm)  
%                     % An IntervalTime from 12:00 pm to 02:00 pm.

tester = id.overlap(ic)

% Test class Event

e1 = Event('10:00 am', '01:00 pm', 60, .5, 1)
    % An Event with id 1, importance .5, and duration 60 mins.
    % It?s available for scheduling in the interval from 10:00 am to 01:00 pm
possibleIntervalTest = IntervalTime('01:00 pm', '02:00 pm')
e1.earliestTime(possibleIntervalTest)
e1ARMins= e1.available.rightTime.timeInMins % Should be 780
e1AWidth= e1.available.getWidth() % Should be 180
%disp(e1.id) % Error: id is private
e1.setScheduledTime('11:00 am')
figure; 
hold on
e1.draw() % Should see colored box with left edge at x=660
%hold off

s3 = Event(500, 650, 70, .5, 7);
s4 = Event(1000, 1200, 40, .3, 7);
possible = IntervalTime(250, 900)
es3 = earliestTime(s3, possible) %should be 500
es4 = earliestTime(s4, possible) %should be inf
s5 = Event(200, 400, 30, .3, 8); 
s5.setScheduledTime(250)
ss5 = s5.scheduledTime %should be 250

s3id = getId(s3)
s4id = getId(s4)
s5id = getId(s5)

e2= Event('02:00 pm', '04:00 pm', 30, .3, 2)
e3= Event('08:00 am', '10:30 am', 60, .7, 3)
s = Schedule('08:00 am', '06:00 pm', 'Test Schedule')
% Instantiate a Schedule object. s.eventArray is empty.
%s.sname= 'foo' % ERROR: property sname has private set access
nam= s.sname % Should be ?Test Schedule?; sname has public get access
s.addEvent(e2) % Add Event e2 to s.eventArray
s.addEvent(e3)
s.addEvent( Event( '11:30 am', '01:00 pm', 45, .2, 4) )
disp(s) % s.eventArray should be a length 3 cell array of Events
id1= s.eventArray{1}.getId(); % Should be 1
s.eventArray{1}.setScheduledTime('02:30 pm')
figure; hold on
s.eventArray{1}.draw() % Should see colored box with left edge at x=870
hold off


% Test class Schedule

schedulealpha = Schedule(100, 1000, 'Tester') %create this schedule
setFraction(schedulealpha, 0.35) %set the schedule fraction

schedulealpha.addEvent(e2) %schedule the following events
schedulealpha.addEvent(e3)
schedulealpha.addEvent(s3)
schedulealpha.addEvent(s4)
schedulealpha.addEvent(s5)
extrasalpha = schedulealpha.scheduleEvents; %should be an array of 1
scheduledeventsalpha = schedulealpha.getScheduledEvents %should be array of 4

% Test class Course
%Run createSchedule on text files as well as extra schedule created
[a1, ex1] = createSchedule('eventdata1.txt', '08:00 am', '06:00 pm');
[a2, ex2] = createSchedule('eventdata2.txt', '08:00 am', '06:00 pm');
%numScheduledEvents1 = [8 9 9 9 9 9 9 9 9 9 9]
%numScheduledEvents2 = [8 8 8 8 8 8 8 8 8 8 8]
%numScheduledEvents3 = [4 4 4 4 4 4 4 4 4 4 4]
%totalMinsScheduled1 = [474 486 486 486 504 504 504 504 504 504 504]
%totalMinsScheduled2 = [574 574 574 564 564 564 564 564 564 564 564]
%totalMinsScheduled3 = [190 190 190 190 190 190 190 190 190 190 190]
[numScheduledEvents1, totalMinsScheduled1] = analyzeSchedule(a1); 
[numScheduledEvents2, totalMinsScheduled2] = analyzeSchedule(a2);
[numScheduledEvents3, totalMinsScheduled3] = analyzeSchedule(schedulealpha);


c1= Course('09:30 am', '11:30 am', 90, 0.5, 5, 'CS1000');
figure; hold on
c1.draw() % Should see white box with x range of 570 to 690
c1.setScheduledTime('09:30 am')
hold off
figure; hold on
c1.draw() % Should see colored box with left edge at x=570 and
% the course name in the middle
hold off
s.addEvent(c1)
sEA= s.eventArray % Should see that the last cell references a Course,
% not an Event





