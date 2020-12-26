%removing a letter from the inputted string
%function [outtie] = IWillTameRecursion(c, outtie)
%     if isempty(outtie)
%         return
%     end
%     if outtie(1) == c
%         disp(outtie)
%         outtie = IWillTameRecursion(c, outtie(2:length(outtie))); 
%     else
%         disp(outtie)
%         outtie = [outtie(1) IWillTameRecursion(c, outtie(2:length(outtie)))];
%     end
% 
% end
        

%exponential one
% function y = IWillTameRecursion(n, p) 
% if p == 0
%     y = 1;
%     return
% end
%     y = n * IWillTameRecursion(n, p-1);
% end


%repeat a word
% function repeater = IWillTameRecursion(starter, repeater, n)
%     if n == 5
%         repeater = [starter IWillTameRecursion(starter, repeater, n-1)]
%     elseif n == 0
%         return
%     else
%         repeater = [repeater IWillTameRecursion(starter, repeater, n-1)]
%     end
% end

%asterisk pyramid creator
% function IWillTameRecursion(n)
%     if n == 0
%         fprintf('Done!')
%         return
%     end
%     for k = 1:n
%         fprintf('*')
%     end
%     fprintf('\n')
%     IWillTameRecursion(n-1)
% end
    
%deckorganizer
% function deck = IWillTameRecursion(firstdeck)
%     n = length(firstdeck);
%     if n == 1 || rem(n,1) == 0.5
%         deck = firstdeck;
%     else
%     value = n/2;
%         xl = IWillTameRecursion(firstdeck(1:value));
%         yr = IWillTameRecursion(firstdeck(value+1:n));
%     deck = merge(xl, yr);
%     end
% end


%create pascal's triangle
             
            
            
% for k = 1:100
%     x = floor(rand*11) - 5; 
%     if x == 6
%         disp(x)
%     end
% end
%             
        
%snowflake triangle thingy
% function IWillTameRecursion(x, y, L)
%     if L == 0
%         fill(x,y,'y', 'linewidth', 1.5)
%     else
%         a = [(x(1) + x(2))/2, (x(2) + x(3))/2, (x(1) + x(3))/2];
%         b = [(y(1) + y(2))/2, (y(2) + y(3))/2, (y(1) + y(3))/2];
%         fill(a,b,'r');
%         IWillTameRecursion([x(1), a(1), a(3)], [y(1), b(1), b(3)], L-1);
%         IWillTameRecursion([x(2), a(1), a(2)], [y(2), b(1), b(2)], L-1); 
%         IWillTameRecursion([x(3), a(2), a(3)], [y(3), b(2), b(3)], L-1);
%     end
% end
%         

%square thingy
% function IWillTameRecursion(x,y,L)
%         a = [(x(1) + x(2))/2, (x(2) + x(3))/2, (x(3) + x(4))/2, (x(1) + x(4))/2];
%         b = [(y(1) + y(2))/2, (y(2) + y(3))/2, (y(3) + y(4))/2, (y(1) + y(4))/2];
%         if rem(L,2) == 1
%             fill(a,b,'b')
%             if ~L==0
%             IWillTameRecursion(a,b,L-1)
%             end
%         else
%             fill(a,b,'r')
%             if ~L==0
%             IWillTameRecursion(a,b,L-1)
%             end
%         end
%     end

% v = [2 5 3 9 6];
% for k = 1:1:length(v)-1
%     absdif = abs(v(k) - v(k+1));
%     if k == 1
%         g = absdif; 
%     else
%         if g < absdif
%             g = absdif;
%         end
%     end
% end

% close all; 
% figure;
% axis equal;
% hold on;
% cTop = [0 .1 .9]; cBot = [.9 .8 .1];
% R = 1; n = 4; S = .25;
% for j = 0:1:n-1
%     for k = 0:(n-1-j)
%         f = k/(n-1); 
%         color = (1-f)*cBot + f*cTop;
%         DrawDisk(j*(2*R + S), k*(2*R + S), R, color)
%     end
% end
% 
% hold off;

