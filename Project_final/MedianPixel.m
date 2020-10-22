function [R,G,B] = MedianPixel(pixels)
% MedianPixel calculates the median RGB values from a list of pixels.
% Input: A 1xnx3 3D array of RGB values representing a list of pixels 
%        (pixel 1 will be in column 1, 2 in column 2, etc).        
% Outputs: 1) The median red value, which will be the median of all the R 
%             values from the list of pixels
%          2) The median green value, which will be the median of all the 
%             G values from the list of pixels
%          3) The median blue value, which will be the median of all the B 
%             values from the list of pixels
% Author: Alex Chen

% Find the median values for each layer of the input array and round them 
% to the nearest integer
R = round(median(pixels(:,:,1)));
G = round(median(pixels(:,:,2)));
B = round(median(pixels(:,:,3)));
end

