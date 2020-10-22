function [frameNumbers] = GenerateFrameList(firstFrame,stepSize,numFrames)
% GenerateFrameList function will create a list of frames we are interested
% in. In particular, it will determine which frames to extract from a movie
% file.
% Inputs: 1) A starting frame number
%         2) A step size
%         3) The number of frames to generate (n)
% Output: frameNumbers, a single 1xn 1D array, where n is the desired 
%                       number of frames (n). The first element of the 
%                       array will be the starting frame number and each
%                       subsequent element will have a frame value that is
%                       the step size greater than the last.
% Author: Alex Chen

% Calculate the value of the last frame needed
lastFrame = firstFrame+stepSize*(numFrames-1);

% Generate the specified number of frames equally spaced between the first
% and last frame
frameNumbers = linspace(firstFrame,lastFrame,numFrames);

end

