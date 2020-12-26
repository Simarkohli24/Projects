function drawPitch()
% Draw a standard soccer pitch with lower left corner at (0,0)

xSize = 105.0;
ySize = 68.0;
boxHeight = 16.5*2 + 7.32; % 40.32
boxWidth = 16.5;
yBox_start = ySize/2 - boxHeight/2; % 13.84
yBox_end = ySize/2 + boxHeight/2; % 54.16

close all;
figure;

x0=0;
y0=0;
set(gcf,'units','points','position',[x0,y0,xSize*5,ySize*5])

axis([0 xSize 0 ySize]);
xlim([0 xSize])
ylim([0 ySize])
hold on;

rectangle('Position',[0,0,xSize,ySize],'FaceColor','g');
circle(xSize/2,ySize/2, 9.15);

x = [xSize/2 xSize/2];
y = [0 ySize];
line(x,y,'Color','k');

%DrawRect(0, yBox_start,boxWidth,boxHeight,'b');
%DrawRect(xSize-boxWidth, yBox_start,boxWidth,boxHeight,'b');
rectangle('Position',[0, yBox_start,boxWidth,boxHeight],'EdgeColor','k');
rectangle('Position',[xSize-boxWidth, yBox_start,boxWidth,boxHeight],'EdgeColor','k');

%X = [0 0.5];
%Y = [0 0.5];
%annotation('arrow',X,Y);

end


function h = circle(x,y,r)

th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'Color','k');
end 