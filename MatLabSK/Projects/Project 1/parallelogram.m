% Construct a parallelogram:
% Given one fixed point, 1 randomly generated point, and 1 user-selected
% point, compute and draw a 4th point that would make a parallelogram. 

% Set up the window
close all        % Close all previous figure windows
figure           % Start a new figure window
hold on          % Keep the same set of axes (multiple plots on same axes)
axis equal       % unit lengths on x- and y-axis are equal
axis([0 10 0 10])  % x-axis limits [0,10], y-axis limits [0,10]
title('Click below in the graph area but not on the line')

% First vertex, show as a blue asterisk
x1=4;  y1=3;
plot(x1, y1, 'b*')


%%% Do not change the code above %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modify the code below %%%%%%%%%%

% Second vertex (randomly generated)
x2= 8*rand + 1;
y2= 8*rand + 1;
plot(x2, y2, 'b*')

% Connect vertices 1 and 2 with a black dotted line
plot([x1 x2], [y1 y2], 'k:')

% Get user-input third vertex and display it as a red circle
[x3, y3]= ginput(1); 
plot(x3, y3, 'ro')
messageToPrint= sprintf('You made a mouse click at (%.1f,%.1f)\n', x3, y3);
title(messageToPrint)

% Determine fourth vertex 
if x1 > x2
    midpointx = abs(x1 - x2)/2 + x2;
else
    midpointx = abs(x2 - x1)/2 + x1;
end

if y1 > y2
    midpointy = abs(y1 - y2)/2 + y2;
else
    midpointy = abs(y2 - y1)/2 + y1;
end

%find coordinates of fourth vertex
x4 = (midpointx - x3) + midpointx;
y4 = (midpointy - y3) + midpointy;

%check to make sure the coordinates are within range
if y4 >= 0 && y4 <= 10 && x4 <= 10 && x4 >= 0
plot(x4, y4, 'b*');
plot([x1 x3], [y1 y3], 'g-')
plot([x2 x3], [y2 y3], 'g-')
plot([x1 x4], [y1 y4], 'b-')
plot([x2 x4], [y2 y4], 'b-')
messageToPrint= sprintf('Computed vertex at (%.1f,%.1f)!', x4, y4);
title(messageToPrint)
else
    messageToPrint= sprintf('Computed vertex at (%.1f,%.1f) out of bounds', x4, y4);
title(messageToPrint)
end


%draw the lines of the parallelogram


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do not change the code below %%%

hold off