
% disp('hello'); 
% fprintf('Im Hungry \n');  

% value = 10.4;
% value2 = sin(30);
% value3 = sin(pi/2);
% value4 = sind(30);

% fprintf('Value: %f \n', value); 
% fprintf('Value: %f \n', value2); 
% fprintf('Value: %f \n', value3);
% fprintf('Value: %f \n', value4);

% for k = 1:10
%     x(k) = k;
%     x(k) = x(k) + 3;
%     disp(x);
% end

% x = [0 3 3 0];
% y = [0 0 1 1];
% hold on
% fill(x,y,[0.0 1.0 1.0])
% fill(x,y+1,[0.4 0.6 1.0])
% fill(x,y+2,[1.0 0.0 1.0])

% close all
% figure(1) 
% axis equal on
% axis([0 10 -1 1])
% hold on
% m = 100;
% 
% for z = 0:0.1:9.9
%     
%     plot([z, z+.1], [cos(z), cos(z+.1)], '-k');
%     plot([z, z+.1], [sin(z), sin(z+.1)], '-k');
%     plot([z, z+.1], [-cos(z), -cos(z+.1)], '-k');
%     plot([z, z+.1], [-sin(z), -sin(z+.1)], '-k');
%     fill([z, z+.1], [cos(z), -cos(z)], 'r')
% end
% 
% hold off

% n = input('Enter number of hits: ');
% m = input('Number of retries: ');
% r = zeros(n,1);
% hit = 0;
% miss = 0;
%     
%     close all
%     figure
%     axis([-2 2 -2 2])
%     axis equal on
%     hold on
%     
%  for a = 0:0.01:0.5
% 
%     b1 = sqrt(.25-(a^2));
%     b2 = -sqrt(.25-(a^2));
% 
%     plot(a, b1, '*r')
%     plot(a, b2, '*r')
%     plot(-a, b1, '*r')
%     plot(-a, b2, '*r')
% 
% end
% 
% for l = 1:m
%    
%     x = 2*rand(n,1) - 1;
%     y = 2*rand(n,1) - 1; 
% 
%     for k = 1:n
% 
%         if ((x(k))^2 + (y(k))^2 <= .25)
%             hit = hit + 1;
%             plot(x(k), y(k), '*g')
%             r(k) = 1;
%         else
%             miss = miss + 1; 
%             plot(x(k), y(k), '*r')
%         end
%      
%     end
% 
% end
% 
% j = [hit;miss];
% disp(j);
% 
% hold off;

% n = input('Enter n value: ');
% 
% close all figure axis([0 (2*n + 1) 0 (2*n + 1)]) axis equal off hold on
% 
% for m = 0:(2*n+1)
%     plot([m, m],[0, 2*n+1], '-k'); plot([0, 2*n+1],[m, m], '-k');
%     
%     plot([1, 2*n], [1, 1], '-r'); plot([1, 1], [1, 2*n], '-r');
%     plot([2*n, 2*n], [1, 2*n], '-r'); plot([1, 2*n], [2*n, 2*n], '-r');
% 
%     DrawRect(n, n, 1, 1, 'r')
% end
% 
% placex = n; placey = n;
% 
% left = 0; right = 0; up = 0; down = 0;
% 
% while ((placex >= 1) && (placex < (2*n)) && (placey >= 1) && (placey <
% (2*n)))
%     probability = ceil(4*rand);
%     
%     if probability == 1
%         
%         placex = placex + 1; DrawRect(placex, placey, 1, 1, 'w') right =
%         right + 1;
%         
%     elseif probability == 2
%         
%         placey = placey + 1; DrawRect(placex, placey, 1, 1, 'w') up = up
%         + 1;
%         
%     elseif probability == 3
%         
%         placex = placex - 1; DrawRect(placex, placey, 1, 1, 'w') left =
%         left + 1;
%         
%     elseif probability == 4
%         
%         placey = placey - 1; DrawRect(placex, placey, 1, 1, 'w') down =
%         down + 1;
% 
%     end
% 
% end
% 
% hold off labels = ['L', 'R', 'U', 'D']; moves = [left, right, up, down];
% b = sum(moves); total = horzcat(labels', moves'); disp(total);
% fprintf('The total moves made were %f!', b);

% income = input('Enter income in dollars: ');
% 
% Over1 = income - 30000;
% Over2 = income - 60000;
% 
% if (income <= 30000)
%     Tax = 0.25*30000;
% end
% 
% if (income > 30000)
%     Tax = 0.25*30000;
%     if ((Over1) <= 30000)
%         Tax = Tax + 0.3*Over1;
%     else
%         Tax = Tax + 0.3*30000;
%     end
%     if ((Over2) > 0)
%         Tax = Tax + 0.4*Over2;
%     end
% end
% 
% disp(Tax);

% 
% nBig = input('Enter larger integer: ');
% nSm = input('Enter smaller integer: ');
% prime = true;


% for number = nBig:-1:nSm
% 	for factor = (2: number-1)
%         if (rem(number, factor) == 0)
%         prime = false;
%         end
%     end
% 
% 	if (prime == true) 
% 		fprintf('%f is prime \n', number);
% 	else
% 		fprintf('%f \n', number);
%     end
%     
% prime = true;
% end

% disp('Determine mode of a set of nonnegative integers.')
% disp('Use a negative number to quit.')
% 
% previous = -1;          % Previous number seen
% count = 1;              % Count of current number
% mode = -1;              % Mode seen so far
% modeCount = 0;          % Count for mode so far
% number = input('Give me a number:  ');
% 
% while number >= 0   % Quit when negative number is encountered
% 
%     if number == previous     % same run, so increment count
%         count = count + 1;
%     else                      % new run, so reset count
%         count = 1;
%     end
% 
%     if count > modeCount
%         mode = number;
%         modeCount = count;
%     end
% 
%     previous = number;
%     number = input('Another number not smaller than the previous: ');    
% end
% 
% if mode == -1
%     disp('Mode is undefined')
% else
%     fprintf('Mode is %d which occurred %d times.\n', mode, modeCount)
% end

% function seconds = ReviewFile(h, m, s)
% 	Secondsh = h*3600;
% 	Secondsm = m*60;
% 	Secondss = s;
% 
% 	seconds = Secondsh + Secondsm + Secondss;
% 
% end

% function [h, m, s] = ReviewFile(x)
%     h = floor(x/3600);
%     m = floor(rem(x, 3600)/60);
%     s = rem(rem(x,3600), 60);
%     disp([h, m ,s]);
% end


% for k = 1:50
%     v = rand;
%     if (v > max) && (v < 0.9)
%         max = v;
%     end
%     disp(v);
% end
% 
% if (max == 0)
%     fprintf('no value smaller than 0.9');
% else
%     disp(max);
% end


% function m = ReviewFile(v, x)
%     l = 0;
%     for k = 1:length(v)
%         if (rem(v(k), x) == 0) && (v(k) > 0)
%             l = l + 1;
%             m(l) = v(k);
%         end
%     end
%     
    
% function ReviewFile(n,w,h)
% 
% figure 
% axis tight
% hold on
% offset = 0;
% wb = .5*w;
% hb = .7*h;
% count = 0;
% for l = 1:n
%     for k = 0:w:(6*w)
%         DrawRect(k+offset,0,w,h,'y')
%         if (count ~= 0) && (count ~= 3) && (count ~= 7)
%             DrawRect((k-(wb/2) + offset), h - (hb), wb, hb, 'k');
%         end
%         count = count + 1;
%     end
%     count = 0;
%     offset = 7*w*l;
% end


% c = input('Length of stick c: '); 
% lo = 2;
% hi = 3;
% [a, b] = yolo(lo, hi);
% s = (a + b + c)/2;
% fprintf('Side1: %f \n', a);
% fprintf('Side2: %f \n', b);
% fprintf('Side3: %f \n', c);
% if (a + b > c) && (b + c > a) && (a + c > b)
%     area = sqrt(s*(s-a)*(s-b)*(s-c));
%     disp(area);
%     if (a == b) && (b == c)
%         fprintf('is equilateral');
%     end
% else
%     fprintf('cannot make triangle');
% end
% 
% 
% function [a, b] = yolo(lo, hi)
%     a = (hi - lo)*rand + lo;
%     b = (hi - lo)*rand + lo;
% end

% tOld = 50;
% tCur = 60;
% n = 2;
% cont = true;
% 
% for k = n+1:365
%     w = 10*rand - 5; 
%     tNew = 0.4*tCur + 0.6*tOld + w;
%     disp(tNew);
%     if (tNew > 80) 
%         if (cont == true)
%             early = k;
%             value = tNew;
%             cont = false;
%         end
%     end
%     tOld = tCur;
%     tCur = tNew; 
% end
% 
% if (cont == true)
%     fprintf('no high temp');
% else
%     fprintf('first high temp of %f on day %.0f', value, early);
% end
% 
%     
%     
%     

% m = [1 2 3; 4 5 6; 7 8 9; 10 11 12];
% [a,b] = size(m);
% disp(a);

% a = input('Enter "a" value: ');
% b = input('Enter "b" value: ');
% c = input('Enter "c" value: ');
% ub = input('Enter upper bound: ');
% lb = input('Enter lower bound: ');

%y = ax^2 + bx + c 
%y = 2ax + b
% 
% discriminantx = -b/(2*a); 
% if a > 0
%     if discriminantx > ub
%         minimumx = ub; 
%         minimumy = a*(minimumx^2) + b*minimumx + c; 
%         maximumx = lb; 
%         maximumy = a*(maximumx^2) + b*maximumx + c; 
%     
%     elseif discriminantx < lb
%         minimumx = lb; 
%         minimumy = a*(minimumx^2) + b*minimumx + c; 
%         maximumx = ub; 
%         maximumy = a*(maximumx^2) + b*maximumx + c; 
%             
%     elseif (discriminantx >= lb) && (discriminantx <= ub)
%         minimumx = discriminantx; 
%         minimumy = a*(minimumx^2) + b*minimumx + c; 
%         lby = a*(lb^2) + b*(lb) + c;
%         uby = a*(ub^2) + b*(ub) + c;
%         if lby >= uby
%            maximumx = lb; 
%            maximumy = lby;
%         else
%             maximumx = ub;
%             maximumy = uby;
%         end
%     end
% end
% 
% if a < 0
%     if discriminatx > ub
%         minimumx = lb; 
%         minimumy = a*(minimumx^2) + b*minimumx + c; 
%         maximumx = ub; 
%         maximumy = a*(maximumx^2) + b*maximumx + c; 
%     
%     elseif discriminantx < lb
%         minimumx = ub; 
%         minimumy = a*(minimumx^2) + b*minimumx + c; 
%         maximumx = lb; 
%         maximumy = a*(maximumx^2) + b*maximumx + c; 
%             
%     elseif (discriminantx >= lb) && (discriminantx <= ub)
%         maximumx = discriminantx; 
%         maximumy = a*(minimumx^2) + b*minimumx + c; 
%         lby = a*(lb^2) + b*(lb) + c;
%         uby = a*(ub^2) + b*(ub) + c;
%         if lby >= uby
%            minimumx = lb; 
%            minimumy = lby;
%         else
%            minimumx = ub;
%            minimumy = uby;
%         end
%     end
% end
%         
% disp([minimumx, minimumy]);
% disp([maximumx, maximumy]);
% 
% 
% 
% 
% n = input('Enter number of breaks: '); 
% length = 0; 
% 
% for k = 1:n
%     breakpoint = rand;
%     if (1 - breakpoint) > breakpoint
%         length = breakpoint + length; 
%     else 
%         length = (1 - breakpoint) + length; 
%     end
% end
% average = (length)/n;
% disp(average); 

% n = input('Enter size of diagram (even): ');
% m = input('Enter number of diagrams: ');
% figure
% axis equal off
% hold on 
% r = 1;
% DrawRect(0, 0, n, n, 'k');
% for j = 0:m-1
%     DrawRect(j*n, j*n, n, n, 'k');
%     for k = (n/2):-1:r
%         if rem(k, 2) == 1
%             DrawStar((j*n) + (n/2), (j*n) + n/2, k, 'y');
%         else
%             DrawStar((j*n) + (n/2), (j*n) + n/2, k, 'm');
%         end
% 
%     end
% end
% 
% hold off
% 
% 
% function DrawStar(xc,yc,r,c)
% % Adds a 5-pointed star to the current window.
% % Assumes hold is on.
% % The star has radius r, center (xc,yc) and color c where c is either
% % an rgb vector or one of the built-in colors 'r', 'g', 'y', 'b',
% % 'w', 'k', 'c', or 'm'.
% 
% % The radius of the inner 5 vertices..
% r2 = r/(2*(1+sin(pi/10)));
% % Set up the vertices...
% for k=1:11
%     theta = (2*k-1)*pi/10;
%     if 2*floor(k/2)~=k
%         % Outer vertex...
%         x(k) = xc + r*cos(theta);
%         y(k) = yc + r*sin(theta);
%     else
%         % Inner vertex...
%         x(k) = xc + r2*cos(theta);
%         y(k) = yc + r2*sin(theta);
%     end
% end
% fill(x,y,c)
% end

% for k = 1:n
%     for j = 1:n
%         product = j*k;
%         fprintf('     %.0f     ', product);
%         if j == n 
%             fprintf('\n');
%         end
%     end
% end


% n = input('Enter number of shots: ');
% size = input('Enter size of board: ');
% figure
% axis ([-size size -size size])
% axis on
% hold on
% for k = 1:n
%     x = rand*2*size - size;
%     y = rand*2*size - size;
%     
%     distance = sqrt(x^2 + y^2);
%     if rem(ceil(distance), 2) == 1
%         plot(x, y, '.r');
%     else
%         plot(x, y, '.b');
%     end
%     
% end
% 
% hold off

% n = input('number of rectangles: ');
% s = input('size of squares: ');
% white = [1 1 1];
% black = [1 0 1];
% 
% figure
% axis equal 
% hold
% 
% for k = 0:n-1 
%     f = (k)/(n-1);
%     color = f*white + (1-f)*black;
%     DrawRect(k*s, 0, s, s, color);
% end

% hold off;

% n = input('Enter n value: ');
% summation = 0;
% for k = 1:100
%     summation = summation + 1/k;
% end
% result = summation - log(n);
% disp(result);


% 
% function ReviewFile(v)
%     exists = false;
%     [s, p] = luck(v); 
%     for k = 1:length(s)
%         if (s(k) < 0) && (p(k) < 0)
%             exists = true;
%         end
%     end
%     if exists == false
%         fprintf('No');
%     else
%         fprintf('Yes');
%     end
% end
% 
%     
% 
%     
% 
% function [s,p] = luck(v)
% count = 0;
%     for k = 1:length(v)-2
%         count = count + 1;
%         s(count) = v(k) + v(k+1);
%         p(count) = v(k)*(v(k+1));
%     end
% end
    
% function ReviewFile(n, s, cTop, cBot)
% close all; figure; axis equal; hold on
%     for j = 0:n-1
%         f = j/(n-1);
%         color = f*cTop + (1-f)*cBot;
%         for k = 0:n-j-1
%             DrawDisk((k*(2*.5+s)), (j*(2*.5+s)), 1, color);
%         end
%     end
%     
%         
% 
% p = imread('Beach.jpeg');
% width= 50;
% frameColor= uint8(200); % light gray
% [nr,nc,nk]= size(p);
% for r= 1:nr
%     for c= 1:nc
% % At pixel (r,c)
%         if (r<=width) || (r>(nr-width)) || ...
%              (c<=width) || (c>(nc-width))
%                 p(r,c,:) = frameColor;      
%         end
%     end
% end


% imshow(p);
            
% A = imread('Beach.jpeg');
% [nr,nc,np] = size(A); 
% for j = 1:np
%     for k = 1:nr
%         for l = 1:nc
%             B(k,l,j) = A(k,((nc+1)-l),j); 
%         end
%     end
% end
% imshow(A);
% disp(size(A));
% imshow(B);
% disp(size(B));
%         
% hold off; 

A = imread('Beach.jpeg'); 
[nr,nc,np] = size(A); 

m = .3*A(:,:,1) + .59*A(:,:,2) + .11*A(:,:,3);

imshow(m);

A = imread('Beach.jpeg');
B = imnoise(A, 'salt & pepper', 0.02); 
C = MedianFilter(B); 
imshow(C);

% histo = zeros(1,26);
% s = 'pineapple';
% alphabet = 'abcdefghijklmnopqrstuvwxyz';
% for k = 1:length(s)
%     for l = 1:length(alphabet)
%         if (strcmp(s(k),alphabet(l)) == 1)
%             histo(l) = histo(l) + 1;
%         end
%     end
% end
% disp(s(1))
% disp(alphabet(1))
% 
% disp(histo)

% M = imread('Beach.jpeg');
% M = double(M);
% r = 100;c = 10; 
% [nr,nc,np] = size(M); 
% g = 0;
% gcr = 0;
% gray1 = uint8((M(r,c,1) + M(r,c,2) + M(r,c,3))/3);
% graymir = uint8((M(c,r,1) + M(c,r,2) + M(c,r,3))/3);
% for k = 1:np
%     g = g + M(r,c,k)/3; 
%     gcr = gcr + M(c,r,k)/3;
% end
% 
% if gray1 < graymir
%     g = gray1;
% else
%     g = graymir; 
% end
% disp(gray1)
% disp(graymir);
% disp(g);
% disp(gcr)
% v = [10 8 6 4 2 0];
% A = length(v); 
% Newlength = 2*A - 1; 
% counter = 0;
% w = zeros(1,Newlength);
% for k = 1:2:Newlength
%     counter = counter + 1;
%     w(k) = uint8(v(counter)); 
% end
% disp(w);
% for k = 2:2:Newlength
%     w(k) = uint8((w(k-1) + w(k+1))/2); 
% end
% disp(v);
% disp(w);

% s = 'hello my name is simar';
% p = input('Enter characters to be analyzed for:' ); 
% 
% slength = length(s); 
% disp(slength);
% plength = length(p); 
% 
% for iinitial = 1:(length(s) - length(p) + 1) 
%     if (strcmp(s(1,iinitial:(length(p) + iinitial)-1),p) == 1) 
%         found = iinitial; 
%     end
% end
% disp(found); 
% 
% 
% M = [0 1 0 2;...
%      5 1 3 0;...
%      2 0 2 1]; 
%  cont = true;
%  [nr,nc] = size(M);
%  i = 1;
%  j = 0;
%  trash = 0; 
%  u = input('Enter max capacity of ruumba:' );
%  while (cont == true) 
%      disp(i);
%      disp('---');
%      while (j < nc) 
%         j = j + 1; 
%          trash = M(i,j) + trash; 
%        
%          if trash >= u 
%              cont = false; 
%          end
%          disp(j)
%          disp(trash)
%          disp(cont)
%      end
%      
%      if (cont == true)
%         i = i + 1;
%      end
%      disp(i);
%      disp('---');
%      while (j > 1) && (cont == true) 
%          j = j - 1;
%          trash = M(i,j) + trash; 
%          if trash >= u
%              cont = false; 
%          end
%          disp(j)
%          disp(trash)
%          disp(cont)
%      end
%  end
%  disp([i j])
%          


% Q = imread('Beach.jpeg'); 
% Q = double(Q);
% i = 20;
% j = 20;
% s = 10;
% [idx, val] = strongestColor(Q, i, j, s); 
% disp(idx)
% disp(val);
% imshow('Beach.jpeg');

% A = [1 7 3 9;...
%     5 4 10 2;...
%     200 2 4 5];
% 
% A = sort(A); 
% A = sort(A'); 
% disp(A);

% figure
% axis([0 110 0 110])
% hold on
% 
% n = 100; 
% dmax = inf;
% imax = 0; 
% jmax = 0;
% 
% for k = 1:n
%     S{k} = rand(2)*100;
%     disp(S{k})
%     plot(S{k}(1,1), S{k}(1,2), '*k');
% end
% 
% for i = 1:n-1
%     for j = i+1:n
%         dnew = sqrt((S{i}(1,1) - S{j}(1,1))^2 + (S{i}(1,2) - S{j}(1,2))^2); 
%         if dnew <= dmax
%             dmax = dnew; 
%             imax = i;
%             jmax = j; 
%         end
%     end
% end
% 
% disp(dmax); 
% disp(imax); 
% disp(jmax);
% plot(S{imax}(1,1), S{imax}(1,2), '*r'); 
% plot(S{jmax}(1,1), S{jmax}(1,2), '*b');
% 
% hold off

% text = 'I like pineapples so much.';
% vocab = {'like', 'much'};
% 
% len = length(text); 
% og = 1; 
% counter = 1;
% counts = zeros(1,length(vocab)); 

% for k = 1:len
%     if text(k) == ' ' || k == len
%         disp(text(og):text(k-1))
%         analyze{counter} = (text(og:k-1)); 
%         counter = counter+1;
%         if ~(k==len)
%             og = k+1;
%             disp(k);
%         end
%     end
% end
% for j = 1:length(analyze)
%     for l = 1:length(vocab)
%         if strcmp(analyze{j}, vocab{l}) == 1
%             counts(l) = counts(l) + 1;
%         end
%     end
% end

% function l = ReviewFile(s)
%     len = length(s); 
%     if len == 1
%         l = s(end);
%         return
%     else
%         l = [s(end) ReviewFile(s(1:(len-1)))];
%     end
% end
% 

% function m = ReviewFile(s,l)
% s = sort(s);
% disp(s)
% len = length(s);
%     if ~length(s) == 1
%         value = floor(len/2);
%         if l < s(value)
%         disp('a')
%         m = [ReviewFile(s(1:value), l) s(value+1:end)];
%         elseif l > s(value+1)
%         disp('b')
%         m = [s(1:value) ReviewFile(s(value+1:end),l)];
%         else 
%         m = [s(1:value) l s(value+1:end)];
%         end
%     else
%         m = sort([s(1) l]);
%     end 
%     
% end
   

%my own little pathfinder
% function l = ReviewFile(path)
% boolean1 = true;
% boolean2 = true;
% [nr, nc] = size(path);
%     if nc == 1
%         l = true;
%         disp('path available!')
%         return
%     end
%         
%             if path(1,1) == 1
%                 if path(1,2) == 1
%                     l = ReviewFile(path(:, 2:end));
%                 else
%                     boolean1 = false;
%                 end
%             else
%                 boolean1 = false;
%             end
%             
%             if path(2,1) == 1 
%                 if path(2,2) == 1
%                     l = ReviewFile(path(:, 2:end));
%                 else
%                     boolean2 = false;
%                 end
%             else
%                 boolean2 = false;
%             end
% 
%             if boolean1 == false && boolean2 == false
%             l = false;
%             disp('no path')
%             return
%         end
% end
% 
% function ReviewFile(x)
%     len = length(x);
%     maxval = max(x);
%     scale = round(max(x)/10); 
%     for k = 1:len
%         for l = 1:round((x(k)/scale))
%             fprintf('*');
%         end
%         fprintf('\n');
%     end
% end
        