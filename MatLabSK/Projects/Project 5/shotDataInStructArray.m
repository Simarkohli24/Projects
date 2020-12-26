function S = shotDataInStructArray()
% Extract data from the shot data file cl-shots-2012.txt.
% See readme.txt for the file format. Exclude the first line (i.e.,
% header) of the data.
% S is a shot structure such that
% S.dist is the distance between the player and the goal (double)
% S.dx is the relative movement along x-axis before the player shot (double)
% S.dy is the relative movement along y-axis before the player shot (double)
% S.goal is 'True' if the shot resulted in a goal; otherwise 'False'
% (char vector)
% S.player is the player's name (char vector)
% S.shot is 'True' if it was a shot; otherwise 'False' (char vector)
% (Note: for our data this field is 'True' always)
% S.team is the team name of the player (char vector)
% S.x is the x position when the player got the ball (double)
% S.y is the y position when the player got the ball (double)

fname = 'cl-shots-2012';
shots = fopen([fname '.txt'], 'r');
[row, col] = size(shots);
parsedShots = {};
for i = 2:row
    parsedShots{i} = parseStr(shots{i,:});
end

for j = 2:row-1 %add values to struct array
    if parsedShots(j, 6) == 'TRUE' %verifies this was a shot 
        S.dist = parsedShots{:, 1};
        S.dx = parsedShots{:, 2};
        S.dy = parsedShots{:, 3};
        S.goal = parsedShots{:, 4};
        S.player = parsedShots{:, 5};
        S.shot = parsedShots{:, 6};
        S.team = parsedShots{:, 7};
        S.x = parsedShots{:, 8};
        S.y = parsedShots{:, 9};
    end
end

end