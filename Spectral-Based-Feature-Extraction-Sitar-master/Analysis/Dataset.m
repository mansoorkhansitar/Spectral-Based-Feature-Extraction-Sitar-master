clc;
clear all;
close all;

file_path=('SitarAudio10.wav');
[z, fs]=audioread(file_path);
nos = length(z);
FFT_size=1024;
division=0.05;
[ c,w,s,k,p,m,noh ] = fret_divide( z,division,FFT_size,fs );
c=c*fs/FFT_size;
w=w*fs/FFT_size;
m=m*fs/FFT_size;