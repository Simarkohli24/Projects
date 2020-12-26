%important parameters: gap length, square length, radius length, number of
%squares

%user input
n= input('Enter number of squares:' );

%setting up the gap (root variable) and paramaterized variables
gap = 0.4; 
radius = sqrt((2*(gap)^2))/2;
SL = ((2 - gap)*n + 0.4)/n;
regdif = (SL + gap);
diskdif = (SL + gap/2);

%setting up specifics of figure (i.e. equal axes, holding)
axis equal off;
hold on; 

%draw blue rectangle (background)
DrawRect(0,0,n*SL + (n-1)*gap, n*SL + (n-1)*gap,'b');

%draw the black squares in accordance with the user's desire (n value), and
%manipulate coordinates while taking into account spatial differences
%between successive squares (both in the x and y direction) through two for
%statements
for s = 0:(n-1)
    for t = 0:(n-1)

DrawRect(0 + regdif*t, 0 + regdif*s, SL, SL, 'k');
DrawRect(0 + regdif*s, 0 + regdif*t, SL, SL, 'k');

    end
end

%draw the white disks through similarly manipulating coordinates while
%taking into account spatial differences between successive discs (both in
%the x and y direction) through two for statements
for x = 0:(n-2)
    for y = 0:(n-2)
        DrawDisk(diskdif + regdif*x, diskdif + regdif*y, radius, 'w')
        DrawDisk(diskdif + regdif*y, diskdif + regdif*x, radius, 'w')
    end
end

hold off;
