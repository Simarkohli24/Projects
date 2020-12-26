% Script spiral
% Draws a logarithmic spiral

% Parameters of the spiral:
turnAngle= 137;
numEdges= 700;
 
% Color is specified by a 3-element vector, each component between 0 and 1.
% The numbers specify the red, green, and blue content respectively.
myColor= [.5  0  .5 ]; 

% Set up the plot window...
close all
set(0,'defaultfigureposition',[128 64 1024 768])
set(0,'defaultaxesfontsize',18)
figure
axis equal off
hold on

% Spiral starts at (0,0)
x_c= 0;
y_c= 0;

for k= 1:numEdges
   
   % Direction of the k-th edge
   theta= (k*turnAngle)*(pi/180);
  
   % k-th edge starts at (x_c,y_c) and ends at (x_next,y_next)
   x_next= x_c + k*cos(theta);
   y_next= y_c + k*sin(theta);
   
   % plot the k-th edge i the specified color
   plot([x_c x_next],[y_c y_next],'color',myColor)
   
   % The "start" of the next leg is the "end" of the current leg
   x_c= x_next;
   y_c= y_next;
   
end

hold off
title(sprintf('Edges = %d    Turn Angle (degrees) = %f',numEdges,turnAngle))
shg
