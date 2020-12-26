format long
volumeLIOH = 0.035;
volumeHCL = input('Enter volume of HCL:' );
molesLIOH = 0.0350 * 0.150; 
molesHCL = volumeHCL * 0.150;
totalvolume = volumeLIOH + volumeHCL;

if molesLIOH > molesHCL
    molesOH = molesLIOH - molesHCL;
    pH = 14 + log10(molesOH/totalvolume);
    disp(pH)
elseif molesHCL > molesLIOH
    molesH = molesHCL - molesLIOH;
    pH = -log10(molesH/totalvolume); 
    disp(pH)
else
    pH = 7;
    disp(pH);
end


a = 1
b = 4.8*10^-5
c = -9.6*10^-6
x = (-b + sqrt(b^2 - 4*a*c))/(2*a)
