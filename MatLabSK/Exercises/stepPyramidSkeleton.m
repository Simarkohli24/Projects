% Script stepPyramid.m 
% Draw a step pyramid with a base rectangle of L-by-H where H<=L.
% Each step has the same height H.  The next rectangle up is 2/3 the 
% width of the rectangle below, and so forth.  The top step must have
% a length no less than H.

L= input('What is the length L of the base of the step pyramid? ');
H= input('What is the height H of each step (H<=L)? ');

% Set up graphics window
close all                  % close all figure windows
figure                     % new figure window
axis equal off             % all axes:  same scale, no display
hold on                    % hold all calls to plot on current axes

% Draw the step pyramid.  Lower left corner of the base is at (0,0)
k = 0;
xchange = 0;

DrawRect(xchange, 0, L, H, 'y')

while (L > H)
    k = k + 1;
    A = L;
    L = 2/3*L;
    diff = (A - L)/2;
    xchange = diff + xchange;
    DrawRect(xchange, k*H, L, H, 'y')
end



hold off
shg
