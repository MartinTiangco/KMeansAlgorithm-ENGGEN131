function [clusters] = AssignToClusters(A,Means)

%The AssignToClusters function assigns each pixel/point of an image to a
%cluster, depending on the nearest mean value.

%Inputs: A        - 3D array with m rows, n columns and 3 layers
%                   containing the data of an RGB image.
%        Means    - 3D array containing k rows, 1 column and 3 layers which
%                   contains the colour information for each of k means.

%Output: clusters - 2D array with m rows, n columns containing the
%                   corresponding cluster number for each pixel in the
%                   image.

%Author: Martin Tiangco

%vectorized version

%gathers size data of array 'A'
[m, n, ~] = size(A);

%reshapes the 3D array 'A' to an array with 1 row, m*n columns and 3 layers
%Note that the number of elements in A does not change.
reshapedA = reshape(A,[1,m*n,3]);

%Calculates the squared distance between 'reshapedA' and 'Means'.
%This returns a 2D array of k rows (number of Means) and m*n columns.
%The squared distance between a single pixel and each mean is stored in a
%column vector.
%i.e. the squaredDistance between a pixel in row 1 column 1 of 'A' and the
%first mean is stored in row 1, column 1. The squaredDistance between the
%same pixel and the second mean is stored in row 2, column 1 and so on...
squaredDistance = (reshapedA(:,:,1) - Means(:,1,1)).^2 + ...
    (reshapedA(:,:,2) - Means(:,1,2)).^2 + ...
    (reshapedA(:,:,3) - Means(:,1,3)).^2;

%For every column, the minimum squaredDistance is found and is stored in a
%1 row, m*n column array as 'minIndex'. This is the closest cluster of the
%pixel. The ~ is the minimum value, but is unimportant and discarded.
[~, minIndex] = min(squaredDistance,[],1);

%creates the 'clusters' array by reshaping the 1 row, m*n column
%'minIndex' array to an m row, n column array.
clusters = reshape(minIndex,[m,n]);

end