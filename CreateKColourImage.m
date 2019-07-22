function myImage = CreateKColourImage(clusters,means)

%The CreateKColourImage function creates an image with its pixels divided
%into k clusters. The colour data for a pixel will be the mean colour
%values of the cluster the pixel belongs to.

%Inputs:   clusters   - 2D array with m rows, n columns specifying which
%                       cluster the pixel/point belongs to
%          means      - 3D array with k rows, 1 column and 3 layers
%                       containing the means for the colour values which
%                       belong in the corresponding clusters. The RGB means
%                       for cluster 1 will be stored in row 1, the RGB
%                       means for cluster 2 will be stored in row 2 and so
%                       on...

%Output:   myImage    - 3D array of unsigned 8 bit integers with m rows, n
%                       columns and 3 layers representing an RGB image. The
%                       colour value of each pixel are the mean values (2nd
%                       input) of the cluster (1st input) they belong to.

%Author: Martin Tiangco

%gathers size data of 'clusters'
[m, n] = size(clusters);

%preallocates myImage 3D array
myImage = zeros(m, n, 3, 'uint8');

%rounds means to nearest integer
intMeans = round(means);

for row = 1:m %cycles through rows
    for col = 1:n %cycles through columns
        
        %finds which cluster the pixel belongs to.
        %this will be used to index into the means to assign the colour
        %value.
        clusterValue = clusters(row,col);
        
        for layer = 1:3 %cycles through RGB layers
            
            %assigns the colour value
            myImage(row,col,layer) = intMeans(clusterValue,1,layer);
        end
    end
end
end