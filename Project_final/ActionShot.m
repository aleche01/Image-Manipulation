function [actionImage] = ActionShot(images)
% ActionShot creates an action shot image by finding the pixels from a 
% stack of images that are most distant from the median RGB values 
% (i.e. each pixel in the new image is obtained by finding the pixel in the 
% same row and column of the source images that is most distant from the 
% median RGB values of the stack of corresponding pixels.)
% Input: A 1xn 1D cell array containing n images, where each element is an
%        RGB image (recall RGB images stored as 3D arrays of uint8 values 
%        ranging from 0 to 255).
% Output: An action shot in the form of an RGB image (stored as 3D arrays 
%         of uint8 values ranging from 0 to 255) 
% Author: Alex Chen

% get the height, width, and number of color layers of each image in the
% input cell array
[m,n,~] = size(images{1});

% call helper function ColorStacks
[redStack,greenStack,blueStack] = ColorStacks(images);

% pre-allocate unint8 arrays for speed
actionImage = zeros(m,n,3,'uint8');
% redStack = zeros(o,m,n,'uint8');
% greenStack = zeros(o,m,n,'uint8');
% blueStack = zeros(o,m,n,'uint8');
R = zeros(m,n,'uint8');
G = zeros(m,n,'uint8');
B = zeros(m,n,'uint8');


% calculate the median values for the color stacks, round them, and convert
% them to double type values
medR = double(round(median(redStack)));
medG = double(round(median(greenStack)));
medB = double(round(median(blueStack)));

% Calculate the squared distance between median values and each value in 
% the color stacks
distancesRed = (double(redStack)- medR).^2;
distancesGreen = (double(greenStack)- medG).^2;
distancesBlue = (double(blueStack)- medB).^2;
% total the distances together into a single array
distancesTotal = distancesRed + distancesGreen + distancesBlue;

% Find the maximum distance calculated and create an array which traces
% which image and which pixel the distance was calculated from.
[~,distancesMax] = max(distancesTotal,[],1);


for i = 1:length(images)
    % for each image, create a logical array where 1 means that the
    % maximum distance was calculated from a pixel from that specific image
    % and a 0 means it came form another image.
    % element-wise multiply the logical array with the corresponding image
    % layer in the previously created color stack arrays
    % create new arrays R,G,B which contain the original pixels which are
    % furthest from the median
    R = (uint8(distancesMax==i).*redStack(i,:,:));
    G = (uint8(distancesMax==i).*greenStack(i,:,:));
    B = (uint8(distancesMax==i).*blueStack(i,:,:));
    % reshape the R G B arrays into 2D arrays and add them to actionImage
    % to additively create the new action shot image
    actionImage(:,:,1) = actionImage(:,:,1) + reshape(R,[m,n]);
    actionImage(:,:,2) = actionImage(:,:,2) + reshape(G,[m,n]);
    actionImage(:,:,3) = actionImage(:,:,3) + reshape(B,[m,n]);
end

% note: this does not use MostDistantPixel in order to avoid looping,
% making the code run faster.




