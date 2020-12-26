%determine the quadrant that an inputted angle falls in

angle = input('Enter the angle (angle):\n');

trueangle = rem(angle, 360);

if (trueangle>=0) && (trueangle<90)
    fprintf('Angle lies in quadrant 1'); 
elseif (trueangle>=90) && (trueangle<180)
    fprintf('Angle lies in quadrant 2'); 
elseif (trueangle>=180) && (trueangle<270)
    fprintf('Angle lies in quadrant 3');
else 
    fprintf('Angle lies in quadrant 4'); 
end