%Original Image
a = imread('ayse.jpeg');

%Adding Noise
J = imnoise(a,'salt & pepper',0.02);
figure
subplot(1,2,2)
imshow(J)
title('Added Noise');
subplot(1,2,1)
imshow(a), title('Original Image');

%Sharpening
b = imsharpen(J,'Radius',10,'Amount',1);
figure
subplot(1,2,1)
imshow(J)
title('Added Noise');
subplot(1,2,2)
imshow(b)
title('Sharpened Image');

%Converting to photo blur
ag=fspecial('average',[5,5]);
g=imfilter(J,ag);
figure
subplot(1,2,1)
imshow(b)
title('Sharpened Image');
subplot(1,2,2)
imshow(g)
title('Blur Photo')

%Drawing Ellipses on photo
figure
imshow(g)
title('Detecting Ellipses')
h_1 = drawellipse('Center',[215 293],'SemiAxes',[23.7697 49.7293], ...
    'RotationAngle',196.2557,'StripeColor','m','Color','r');
h_2 = drawellipse('Center',[279 288],'SemiAxes',[21.1896 44.1022], ...
    'RotationAngle',167.8482,'StripeColor','m','Color','r');

%Creating Masks
mask_1 = createMask(h_1);
mask_2 = createMask(h_2);

%Showing the only mask photo
r=mask_1+mask_2;
figure,imshow(r)
title('Masks');

%Adding the masks to filtered image
t=(g)+255*uint8(mask_1)+255*uint8(mask_2);
t(t==255)=0;
figure
subplot(1,2,1)
imshow(a)
title('Original Image')
subplot(1,2,2)
imshow(t)
title('Filtered Image')
figure
imshow(t)
title('Filtered Image')
