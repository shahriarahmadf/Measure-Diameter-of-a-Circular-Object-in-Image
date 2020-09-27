%% import image

clear;
clc;

obj = imread('1.jpg');
imshow(obj);

%% image segmentation

red = obj(:,:,1);
green = obj(:,:,2);
blue = obj(:,:,3);

figure(1)
subplot(2,2,1); 
imshow(obj);
title('original');

subplot(2,2,2); 
imshow(red);
title('red');

subplot(2,2,3); 
imshow(green);
title('green');

subplot(2,2,4); 
imshow(blue);
title('blue');

%% blue threshold and remove noise
figure(2)
level=0.37;
bw2 = im2bw(blue,level);
subplot(2,2,1);imshow(bw2);
title('blue plane threshold');

fill = imfill(bw2,'holes');
subplot(2,2,2);
imshow(fill);
title('noise filled');

clear = imclearborder(fill);
subplot(2,2,3);
imshow(clear);
title('clear bobs on border');

se = strel('disk',7);
open = imopen(fill,se);
subplot(2,2,4);
imshow(open);
title('clear small blobs < 7px');

%% measure dia

dia = regionprops(open,'MajorAxisLength')

figure(3)
imshow(obj)
d = imdistline; 