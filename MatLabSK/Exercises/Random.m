

m = zeros(21,21);
curposi = 11;
curposj = 11;

while (curposi >= 1) && (curposi <= 21) && (curposj >= 1) && (curposj <= 21)
    movement = ceil(4*rand);
    if movement == 1 
        curposi = curposi - 1;
    elseif movement == 2
        curposi = curposi + 1; 
    elseif movement == 3
        curposj = curposj - 1; 
    else
        curposj = curposj + 1; 
    end
    if (curposi >= 1) && (curposi <= 21) && (curposj >= 1) && (curposj <= 21)
        m(curposi, curposj) = m(curposi, curposj) + 1;
    end
end
disp(m);
curmax = 0;
for i = 1: 21
    for j = 1:21
        if m(i,j) >= curmax
            curmax = m(i,j);
            imaxvalue = i;
            jmaxvalue = j;
        end
    end
end
fprintf('Max at %.0f, %.0f', imaxvalue, jmaxvalue);
        

