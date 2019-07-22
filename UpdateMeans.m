function [means] = UpdateMeans(A,k,clusters)

%The UpdateMeans function calculates the mean value for each cluster.

%Inputs:     A        - 3D array with m rows, n columns and 3 layers of
%                       data containing an RGB image.
%            k        - Number of clusters
%            clusters - 2D array of m rows, n columns which specify the
%                       cluster the pixel belongs to.

%Outputs:    means    - 3D array of k rows, 1 column and 3 layers
%                       of the means of each cluster
%                       e.g. the RGB means for cluster 1 will be stored in
%                       row 1, the RGB means for cluster 2 will be stored
%                       in row 2...

%Author: Martin Tiangco

%preallocates 'means' array
means = zeros(k,1,3);

%separates RGB layers into 2D matrices
redLayer = A(:,:,1);
greenLayer = A(:,:,2);
blueLayer = A(:,:,3);

%cycles through the number of clusters
for i = 1:k
    
    %creates a 2D logical array called 'B' where 1 is true and 0 is false.
    %It is true at the positions where the elements in
    %the 'clusters' matrix equals i
    B = (clusters == i);
    
    %this returns a single value of the number of values where B is true
    %by summing the 1's in the logical array.
    %'numValues' will be used to calculate the updated mean.
    numValues = sum(B(:));
    
    %calculates the mean values of the R, G, B colour data and stores them
    %in a k row, 1 column, 3 layer array.
    means(i,1,1) = sum(redLayer(B)) / numValues;
    means(i,1,2) = sum(greenLayer(B)) / numValues;
    means(i,1,3) = sum(blueLayer(B)) / numValues;
    
end
end