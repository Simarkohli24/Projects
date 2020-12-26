% Script convertCel2Fah
% Convert temperatures from Celcius scale to Fahrenheit

fprintf('Convert temperature from Celsius to Fahrenheit\n')
degreeC = input('Enter the temperature (Celsius): ');

% convert to Fahrenheit
degreeF = degreeC*9/5 + 32;
fprintf('In Fahrenheit it is %10.2f degrees.\n', degreeF)
