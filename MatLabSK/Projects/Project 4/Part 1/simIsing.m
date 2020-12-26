n = 50; %defined n value
p = 0.75; %defined p value
T = input('Enter temperature: '); %easier method to manipulate T instead of changing T by modifying script
Runs = input('Enter number of runs: '); %easier method to test long-term/short-term behavior of iSing model 
A = InitialIsing(n,p); %initialize matrix using InitialIsing function
for j = 1:Runs %run metropolis sweeps for Runs amount of times
    pcolor(A) %get color of matrix each time program is run
    A = Sweep(A,T); %run sweep and set A equal to the output of the function
end
%At T = 0, the program will reach uniformity and -1 begin to clump together
%and refrain from mixing with +1s unlike other, higher temperatures. 
%Observations indicate that when 0<T<=1, the iSing model results in the 
%"clumping" of -1 values around each other. %If the program is allowed to
%run for a long time (approximately 10-15 runs), the simulation will eventually reach 
%a point where all values are 1) However at higher temperatures greater
%than 1, the simulation becomes %more random and mixed, where there seems to be a stable level of -1s and
%1s in the system under constant fluctuation. The program allows for the
%interpretation of temperature as when temperatures are low (solid phase),
%much of the atoms are in the same orientation and uniformity is observed.
%However as temperatures increase, the liquid phase allows for
%randomness/fluctuation and motion. Finally, in the gas phase, high levels
%of randomness and instability are observed (indicated by how iSing doesn't
%approach uniformity at high temperatures unless given a larger field
%magnitude). 

%As temperature increases, more mixing of -1 and 1 occurs. 



