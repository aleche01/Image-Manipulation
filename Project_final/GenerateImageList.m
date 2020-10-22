function [imageNames] = GenerateImageList(dirname,fileType)
% GenerateImageList fetches a list of the names of all the images with a
% particular file extension that are contained in a specified directory
% Inputs: 1) A string containing the name of the directory the images are 
%            contained in
%         2) A string containing the file extension of the images to fetch
% Outputs: A 1xn 1D cell array containing n strings where each element is 
%          the filename of an image from the specified directory that has
%          a particular file extension
% Author: Alex Chen

% Check if the specified folder can be found in the specified path
if isfolder(dirname) == 1
    % generate structure array containing information about files with the 
    % specified file extension that are found in the folder 
    files = dir([dirname '\*.' fileType]);
    % create a cell array containing the names of the files in the
    % structure array
    imageNames = {files.name};
else
    sprintf('%s is not a valid directory',dirname)
end
