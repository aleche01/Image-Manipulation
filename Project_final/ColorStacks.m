function [redStack,greenStack,blueStack] = ColorStacks(images)
% ColorStacks sorts the RGB values of images into arrays by their color 
% layer
% Input: A 1xn 1D cell array containing n images, where each element is an
%        RGB image (recall RGB images stored as 3D arrays of uint8 values 
%        ranging from 0 to 255).
% Outputs: 1) An array made by stacking the red layers of each image
%            together
%          2) An array made by stacking the green layers of each image
%            together
%          3) An array made by stacking the blue layers of each image
%            together
% Author: Alex Chen

% get the height, width, and number of color layers of each image in the
% input cell array
[m,n,o] = size(images{1});
p = length(images);

% pre-allocate unint8 arrays for speed
redStack = zeros(p,m,n,'uint8');
greenStack = zeros(p,m,n,'uint8');
blueStack = zeros(p,m,n,'uint8');


for i = 1:p
    % stack the red layers from each image into a single array
    redStack(i,:,:) = images{i}(:,:,1); 
    % stack the green layers from each image into a single array
    greenStack(i,:,:) = images{i}(:,:,2);
    % stack the blue layers from each image into a single array
    blueStack(i,:,:) = images{i}(:,:,3);
end

