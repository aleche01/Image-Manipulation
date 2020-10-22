function [images] = ReadImages(dirname,imageNames)
% ReadImages reads through a specified list of images given the file names
% and the directory the files are
% Inputs: 1) A string containing the name of the directory the images are 
%            contained in
%         2) A 1xn 1D cell array containing n strings where each element
%            is a filename of an image to read          
% Outputs: A 1xn 1D cell array containing n images, where each element is 
%          an RGB image (recall RGB images stored as 3D arrays of uint8 
%          values ranging from 0 to 255). The first image will correspond  
%          to the first filename from the list of filenames
% Author: Alex Chen

% Pre-allocate the size of images array to 1x10 to increase speed
images = cell(1,10);

% search for each file name specified in the imageNames array in the
% specified directory
for i = 1:length(imageNames)
    % read the image data for each image found and store the 3D array data 
    % for each image in a 1D array called images
    imageData = imread([dirname '\' imageNames{i}]);
    images(i) = [{imageData}];
end

% Remove empty cells from images array
images = images(~cellfun('isempty',images));

