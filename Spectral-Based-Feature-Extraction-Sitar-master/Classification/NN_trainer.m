clc;
clear all;
close all;
D=load('Datac'); %Input feature set with only Centroid
%D=load('Datacw'); %Input feature set with Centroid and Width
%D=load('Datacws'); %Input feature set with Centroid,Width and Skewness
%D=load('Datacwsk'); %Input feature set with Centroid,Width and Skewness
%D=load('Datacwskpm'); %Input feature set with Centroid,Width,Skewness &
                        %Kurtosis

%D=load('Datacwsp'); %Input feature set with Centroid,Width,Skewness &Pitch

T=load('SitarAudio10'); % Target Data
%
net=patternnet(20,'trainscg'); % 20 hidden layers using Scaled conjugate Gradient
net.divideParam.trainRatio=.8; % 80% Training ratio
net.divideParam.valRatio=.1; % 10% validation ratio
net.divideParam.testRatio=.1; % 10% testing ratio


[net,pr]=train(net,D.D,T.A); % Training 
%}