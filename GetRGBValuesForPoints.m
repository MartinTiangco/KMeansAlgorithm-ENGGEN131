function [colourValues] = GetRGBValuesForPoints(A, points)

%The GetRGBValuesForPoints function gathers the RGB (Red-Green-Blue) colour
%values for a list of randomly selected points from the image data.

%Inputs:    A            - 3D image data array where the colour data is
%                          gathered from.
%           points       - 2D array of randomly selected pixels with k
%                          rows, 2 columns. These points will be the
%                          positions where the colour values are collected
%                          from. This is the output of the
%                          SelectKRandomPoints function.

%Output:    colourValues - 3D array of k rows, 1 column and 3 layers
%                          displaying the colour values of the pixel.

%Author: Martin Tiangco

%gets k row size data from 'points'. The column size is discarded.
[k, ~] = size(points);

%Preallocates a 3D array 'colourValues' with k rows, 1 column and 3 layers
colourValues = zeros(k,1,3);

for i = 1:k
    %saves the row i and column data of 'points' to a temporary 1x2
    %array named 'loc' (location). This will be used for indexing.
    loc = points(i,:);
    
    %extracts the RGB colour values of 'A' and stores in a 3D
    %array with k rows, 1 column and 3 layers named 'colourValues'.
    colourValues(i,1,:) = A(loc(1),loc(2),:);
    
end

end