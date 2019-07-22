function [clusters, means] = KMeansRGB(A, seedMeans, iterations)

%The KMeansRGB function assigns the points of an image to k clusters
%by using the k-means algorithm.

%Inputs:   A          - 3D array with m rows, n columns and 3 layers
%                       containing the data of an RGB image.
%          seedMeans  - 3D array with k rows, 1 column and 3 layers
%                       containing the seed mean values to initialise the
%                       k-means algorithm
%          iterations - Maximum number of iterations to perform.

%Outputs:  clusters   - 2D array with m rows, n columns specifying which
%                       cluster the pixel/point belongs to
%          means      - 3D array with k rows, 1 column and 3 layers
%                       containing the means for the colour values which
%                       belong in the corresponding clusters. The RGB means
%                       for cluster 1 will be stored in row 1, the RGB
%                       means for cluster 2 will be stored in row 2 and so
%                       on...

%Author: Martin Tiangco

%gathers size data from 'A' and 'seedMeans'
%only m rows and n columns are collected from A
%only k rows are collected from seedMeans
[m, n, ~] = size(A);
[k, ~, ~] = size(seedMeans);

%preallocation of 'clusters', 2D array with m rows, n columns
clusters = zeros(m, n);

%preallocation of 'means' array with k rows, 1 column, 3 layers
means = zeros(k, 1, 3);

%saves to 'prevMeans' which will be used to compare between the previous
%means and the newly calculated means
prevMeans = seedMeans;

%begins the iteration count
iterationCount = 1;

%if iterationCount is more than total iterations the user has inputted, the
%loop will stop.
while iterationCount <= iterations
    
    %displays the current iteration count
    disp(['Iteration ' num2str(iterationCount)])
    
    %assignment step:
    %uses AssignToClusters function to place pixels in the RGB image array
    %'A' to closest cluster
    [clusters] = AssignToClusters(A,prevMeans);
    
    %update step:
    %updates the mean values
    [means] = UpdateMeans(A,k,clusters);
    
    if isequal(prevMeans,means) %if prevMeans and means are equal
        
        %displays to the user that convergence was successful and will
        %output the arrays 'clusters' and 'means'
        iterationCount = iterations + 1; %stops the while loop
        disp('Convergence has been reached! (happy happy)');
        
    else %if they are not equal
        
        %the newly calculated 'means' will be stored as the previous means
        %for the next iteration
        prevMeans = means;
        
        if iterationCount == iterations
            %if the iterationCount is equal to the total iterations
            %then convergence was not achieved. A message explaining this
            %is displayed and will output 'cluster' and 'means'
            disp(['Maximum number of iterations has been reached. ' ...
                'The code has stopped.']);
        end
        
        %increases the counter 'iterationCount' by 1. If the total
        %iterations has been reached, this will stop the while loop.
        iterationCount = iterationCount + 1;
    end
    
end

end