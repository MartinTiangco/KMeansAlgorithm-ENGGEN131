# KMeansAlgorithm-ENGGEN131
This is a project in The University of Auckland's Bachelor of Engineering (Honours) degree in course named 'ENGGEN 131: Introduction to Engineering Computation and Software Development'. 

This uses the K-Means algorithm to convert an image of many colours into an image with k colours. Here is an example using one of my own pictures (named 'The Edge of the World') below!

|Original Image | 16-colour image | 8-colour image |
|---| --- | --- |
|![Original Picture][picOriginal]|![16-colour image][pic16Colour]|![8-colour image][pic8Colour]

##### How it works
This project is all about the k-means clustering algorithm. The algorithm is used to group the pixel colours used in the original image into clusters.

This technique allows for data to be sectioned into k clusters (where a small number of clusters is normally used). 

Firstly, k means are randomly chosen. K-means algorithm then alternates between these two steps:

* Assignment: each data point is assigned to the closest cluster depending on its distance from the cluster mean
* Update: for each cluster, we calculate new mean values based on the values of the points assigned to that cluster

Repeat the step until the means do not change in the next iteration. This means the algorithm has converged.

The reduced colour image is then as accurate a representation of the original colour as possible.




[picOriginal]: https://github.com/MartinTiangco/KMeansAlgorithm-ENGGEN131/blob/master/Pictures/edgeOfTheWorld.JPG "Original picture"

[pic16Colour]: https://github.com/MartinTiangco/KMeansAlgorithm-ENGGEN131/blob/master/Pictures/16colouredgeOfTheWorld.jpg "Picture with 16 colours"

[pic8Colour]: https://github.com/MartinTiangco/KMeansAlgorithm-ENGGEN131/blob/master/Pictures/8colouredgeOfTheWorld.jpg "Picture with 8 colours"
