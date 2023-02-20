close all;
clc

%Read the input
I = imread(''); % inter the image location
subplot(2,2,1),imshow(I);
title('Original Image');

% to detect face
FDetect = vision.CascadeObjectDetector;
BB = step(FDetect,I);
subplot(2,2,2),imshow(I);
hold on
for i=1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','b');
end
title('Face Detection');
hold off;

% To detect nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',24);
BB = step(NoseDetect,I);

subplot(2,2,3),imshow(I);
hold on
for i=1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','g');
end
title('Nose Detection');
hold off;

% to detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',128);
BB = step(MouthDetect,I);

subplot(2,2,4),imshow(I);
hold on
for i=1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','r');
end
title('Mouth Detection');
hold off;
