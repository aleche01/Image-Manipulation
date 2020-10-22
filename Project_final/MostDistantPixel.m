function [R,G,B] = MostDistantPixel(pixels)
% MostDistantPixel calculates the pixel from a list that is most distant 
% from the median RGB values of that list. The distance metric to be used 
% is that described in the PixelDistance task (i.e. the squared distance
% between points in RGB colour space)
% Input: A 1xnx3 3D array of RGB values representing a list of pixels 
%        (pixel 1 will be in column 1, pixel 2 in column 2 etc). 
% Outputs: 1) The red value of the most distant pixel
%          2) The green value of the most distant pixel
%          3) The blue value of the most distant pixel 
% Author: Alex Chen

% Call MedianPixel function and store median values into an array called 
% medianPoints
[R,G,B] = MedianPixel(pixels);
medianPoints = [R G B];

% convert medianPoints and pixels to double type values
doubleMedianPoints = double(medianPoints);
doublePixels = double(pixels);

% preallocate distances array
distances = zeros(1,length(pixels),'double');

% get the size of the pixels array
% knowing it is 1xnx3, we need to know what n is so that we can calculate
% the distance
[m,n,o] = size(pixels);

% Calculate the squared distance between medianPoints and each point in 3D
% color space from the input list of pixels
for i = 1:n
    distances(i) = PixelDistance(doubleMedianPoints,doublePixels(1,i,:));
end

% Find the maximum distance calculated
dMax = max(distances);

% Compare the maximum distance with each value in the distance array until
% a match is found, in which case R, G, and B will equal the corresponding 
% point in 3D color space
for j = 1:n
    if dMax == distances(j)
        R = pixels(1,j,1);
        G = pixels(1,j,2);
        B = pixels(1,j,3);
    end
end
