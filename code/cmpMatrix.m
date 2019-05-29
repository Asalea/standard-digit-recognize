function output = cmpMatrix(img1, img2)
%This function intends to compare similarity of two (identical size)matrix.
%r ranges between [0,1], larger r means higher similarity.

a = double(img1(:));
b = double(img2(:));
r=dot(a,b) / (sqrt( sum( a.*a )) * sqrt( sum( b.*b )));
output = r;