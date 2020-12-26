function probability = computeShotProb(minR, maxR)
%minR is low end of the distance range of interest (double)
%maxR is high end of the distance range of interest
[row, col] = size(S.x);
totalShots = 0;
goals = 0;

for i = 1:row
    if minR<=S.dist{k} && S.dist{k}<=maxR
        if S.shot{k} == 'TRUE'%verifies it was a shot from minR to maxR
            totalShots = totalShots + 1;
            if S.goal{k} == 'TRUE' %if goal, add to goals
                goals = goals + 1;
            end
        end
    end
end
probability = goals/totalShots;
end