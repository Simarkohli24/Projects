close all;
hold on;

A = imread('Beach.jpeg');
[nr,nc,np] = size(A); 
for j = 1:np
    for k = 1:nr
        for l = 1:nc
            B(k,l,j) = A(k,((nc+1)-l),j); 
        end
    end
end
imshow(A);
disp(size(A));
imshow(B);
disp(size(B));
        
hold off;