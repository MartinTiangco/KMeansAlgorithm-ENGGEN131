function [squaredDistance] = SquaredDistance(P, Q)

%The SquaredDistance function calculates the square of the distance between
%two points in 3D space P and Q.

%Inputs:    P               - An array of three elements of the first point
%                             in 3D space
%           Q               - An array of three elements of the second
%                             point in 3D space

%Output:    squaredDistance - The square of the distance between P and Q

%Author: Martin Tiangco

%work out the squared distance between 3 element arrays P and Q
squaredDistance = (P(1) - Q(1)).^2 + (P(2) - Q(2)).^2 + (P(3) - Q(3)).^2;


end