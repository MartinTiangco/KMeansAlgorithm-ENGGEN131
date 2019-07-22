function [points] =  SelectKRandomPoints(A, k)

%This function, SelectKRandomPoints generates a list of randomly
%selected pixels from an image array.

%Inputs:    A            - 3D image from which to select points from
%           k            - The number of points to select

%Output:    points       - 2D array containing k rows and 2 columns of
%                          randomly selected points from the image (pixels)

%Author: Martin Tiangco

%vectorized version

%Reads the size of the image data
%The number of layers is stored in ~, which is discarded.
[m, n,~] = size(A);

%selects k number of unique points out of a possible m*n combinations
%using linear indexing and saves into variable 'p'
p = randperm(m*n, k);

%searches for row (i) and column (j) indexes for the unique integers
%generated from randperm (using an m row, n column sized matrix)
[i, j] = ind2sub([m,n], p);

%combines 'i' and 'j' into a 2D array 'points' containing k rows and 2
%columns by using transpose operator
points = [(i)',(j)'];
end
