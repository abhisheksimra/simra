FDetect = vision.CascadeObjectDetector;

Image = imread('E:\pic\pics\2017-05-21-20-46-32-002.jpg');
subplot(1,2,1),imshow(Image);

BB = step(FDetect,Image);

subplot(1,2,2),imshow(Image);
hold on
for i=1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',3,'LineStyle','-','EdgeColor','b');
end
title('Face Detection');
hold off;