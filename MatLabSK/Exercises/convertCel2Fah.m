% Script convertFah2Cel
% Convert temperatures from Fahrenheit scale to Celsius

fprintf('Convert temperature from Fahrenheit to Celsius\n')
degreeF = input('Enter the temperature (Fahrenheit): ');

% convert to Celsius
degreeC = (5/9)*(degreeF - 32);
fprintf('In Celsius it is %0.2f degrees.\n', degreeC)
