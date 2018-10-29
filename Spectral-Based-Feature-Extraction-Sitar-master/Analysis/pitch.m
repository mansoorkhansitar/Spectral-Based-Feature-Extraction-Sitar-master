function [ s ] = pitch( K,freq_signal,e1,noh,M,FFT_size)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 for i=1:noh
    t=freq_signal(:,i);
                for j=1:FFT_size/2
                freq_signal(j,i)=t((FFT_size/2)-j+1);
                end
end
y=K*freq_signal; 
[~,I]=max(y);
s=M(I);
for o=1:noh

        if e1(o)==0

            s(o)=0;
        end
end   
 
end

