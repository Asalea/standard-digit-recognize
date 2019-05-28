function output = cmpMatrix(img1, img2)
a = double(img1(:));
b = double(img2(:));
r=dot(a,b) / (sqrt( sum( a.*a )) * sqrt( sum( b.*b )));
output = r;