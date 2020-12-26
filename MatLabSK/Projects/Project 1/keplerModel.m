%Title of the program
fprintf('Planetary Orbits\n'); 

%Equations used to convert outside radius to inside radius and find radii
%of circles
sph1radius = input('Enter the radius (sph1radius):\n');
%cube
sph2radius = (sqrt(3)/3)*sph1radius;
%tetrahedron
sph3radius = (1/3)*sph2radius;
%dodecahedron
sph4radius = (sqrt(250 + (110*sqrt(5)))/(((5*sqrt(15)) + (5*sqrt(3)))))*sph3radius;
%icosahedron
sph5radius = ((sqrt(42 + 18*sqrt(5)))/(3*(sqrt(10 + 2*sqrt(5)))))*sph4radius;
%octahedron
sph6radius = (sqrt(3)/3)*sph5radius;

%Equations to calculate respective circumferences of the circles
circumference1 = 2*pi*sph1radius;
circumference2 = 2*pi*sph2radius;
circumference3 = 2*pi*sph3radius;
circumference4 = 2*pi*sph4radius;
circumference5 = 2*pi*sph5radius;
circumference6 = 2*pi*sph6radius;

%Print sphere number, radius, and circumference in a table format
fprintf(' Sphere         Radius             Circumference\n');
fprintf(' %3.0f      %3.15f      %3.15f\n', 1, sph1radius, circumference1); 
fprintf(' %3.0f      %3.15f      %3.15f\n', 2, sph2radius, circumference2); 
fprintf(' %3.0f      %3.15f      %3.15f\n', 3, sph3radius, circumference3);
fprintf(' %3.0f      %3.15f      %3.15f\n', 4, sph4radius, circumference4);
fprintf(' %3.0f      %3.15f      %3.15f\n', 5, sph5radius, circumference5);
fprintf(' %3.0f      %3.15f      %3.15f\n', 6, sph6radius, circumference6);
 
