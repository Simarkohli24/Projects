k1 = 100; %initalize K values of springs
k2 = 50;
k3 = 75;
k4 = 200;

%initalize force value
F = 2000;

%create matrix of set of equations
A = [(-k2 - k1) (k2) 0 0; (-k2) (-k3-k2) (k3) 0; 0 (-k3) (-k4-k3) (k4); 0 0 (-k4) (k4)];

%create "equals to" matrix (constants stuff)
B = [0; 0; 0; F];

%solve for the x1, x2, x3, x4
x = A\B;

%create labelling mechanism
l = ['      x1    ' '    x2    ' '    x3    ' '    x4    '];

%transpose x to label
x = x';

%display values
disp(l);
disp(x);