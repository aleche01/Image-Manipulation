function [imageRemoved] = RemoveAction(images)
% RemoveAction creates an image that has the action removed by applying a 
% median filter (i.e. each pixel in the new image is obtained by taking the
% median RGB values of the stack of corresponding pixels taken from the 
% source images.
% Input: A 1xn 1D cell array containing n images, where each element is an 
%        RGB image
% Output: An RGB image (stored as 3D arrays of uint8 values ranging from 0 
%         to 255) that was obtained by taking the median RGB values of the 
%         stack of corresponding pixels from the source images.
% Author: Alex Chen


% get the height, width, and number of color layers of each image in the
% input cell array
[m,n,o] = size(images{1});

% call helper function ColorStacks
[redStack,greenStack,blueStack] = ColorStacks(images);

% pre-allocate unint8 arrays for imageRemoved and coloured stacks for speed
imageRemoved = zeros(m,n,o,'uint8');
% redStack = zeros(o,m,n,'uint8');
% greenStack = zeros(o,m,n,'uint8');
% blueStack = zeros(o,m,n,'uint8');
% 
% 
% for i = 1:o
%     % stack the red layers from each image into a single array
%     redStack(i,:,:) = images{i}(:,:,1); 
%     % stack the green layers from each image into a single array
%     greenStack(i,:,:) = images{i}(:,:,2);
%     % stack the blue layers from each image into a single array
%     blueStack(i,:,:) = images{i}(:,:,3);
% end



% find the rounded median R G B values of each pixel from the stacked 
% images and send them to their corresponding location and color layer
% on a new array
imageRemoved(:,:,1) = round(median(redStack));
imageRemoved(:,:,2) = round(median(greenStack));
imageRemoved(:,:,3) = round(median(blueStack));

% Note: MedianPixels is not used here to avoid looping, increasing the 
% speed of the code. Instead of finding the median of each individual 
% stack of pixels, all pixels from all images on the same color layer are
% put into a separate array so that we can calculate the all of the medians
% at once.






