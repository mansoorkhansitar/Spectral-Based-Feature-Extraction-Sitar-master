function [ z,fs,nos ] = Audio_input( file_path )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%siz = wavread(file_path,'size');
%
%nos=siz(1);    % Number of samples in the file


    % Find the sampling frequency
    [z, fs]=audioread(file_path);
    nos = length(z);
        
    

end

