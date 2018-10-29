function [ centroid,width,skew,kurtosis,s,m,noh ] = fret_divide( X,division,FFT_size,fs )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
nos=size(X);
nos=nos(1);
%s_frm=round(nos/division);
s_frm=division*fs;
[ freq_signal,~,noh] = Nfft( X,nos,s_frm,FFT_size);
[ ~,e1 ] = energy( freq_signal,noh,FFT_size);
[ centroid,width,skew,kurtosis] = spectral_features( freq_signal,noh,FFT_size,e1 );% spectral_features is a function to calculate the moments and features
[~,m]=max(freq_signal);
[K,M]=impulse_template(FFT_size/2,fs);    
[ s ] = pitch( K,freq_signal,e1,noh,M,FFT_size);   
%[ p ] = Exact_pitch( e1,s,noh );
end

