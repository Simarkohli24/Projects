%determine the quadrant that an inputted angle falls in

angle = input('Enter the angle (angle):\n');

trueangle = rem(angle, 360);

if (trueangle>=0) && (trueangle<90)
    fprintf('Angle lies in quadrant 1'); 
end

if (trueangle>=90) && (trueangle<180)
    fprintf('Angle lies in quadrant 2'); 
end

if (trueangle>=180) && (trueangle<270)
    fprintf('Angle lies in quadrant 3'); 
end

if (trueangle>=270) && (trueangle<360)
    fprintf('Angle lies in quadrant 4'); 
end