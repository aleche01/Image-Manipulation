function [squaredDistance] = PixelDistance(firstPoint,secondPoint)
% PixelDistance calculates the square of the distance between two points in
% colour space
% Inputs: 1) An array containing three elements representing a point in 3D
%            colour space
%         2) An array containing three elements representing a second point 
%            in 3D colour space
% Outputs: The square of the distance between the two
%          points in 3D colour space.
                        
% Author: Alex Chen

% convert points to double type values
firstPoint = double(firstPoint);
secondPoint = double(secondPoint);

% Calculate the squared distance using formula 
% D = (P1-Q1)^2 + (P2-Q2)^2 + (P3-Q3)^2
squaredDistance = (firstPoint(1)-secondPoint(1))^2 + (firstPoint(2)-secondPoint(2))^2 + (firstPoint(3)-secondPoint(3))^2;
