clc
clear all
close all

camera = webcam;
nnet = alexnet;
picture = camera.snapshot;
figure(1);
image(picture);
picture = imresize(picture,[227,227]);
lable = classify(nnet, picture);
title(upper(char(lable)));
