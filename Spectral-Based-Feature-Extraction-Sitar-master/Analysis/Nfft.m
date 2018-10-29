function [ freq_signal,spec_gram1,noh] = Nfft( z,nos,s_frm,FFT_size)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 s_frm=s_frm+3-mod(s_frm,3);
   noh=floor(nos/s_frm);
    noh=noh*3;
        % From which hop all the frames lie inside the file
        %{
    for n=1:noh
        lwr_sample=n*s_hop-ceil(s_frm/2);
        if(lwr_sample>0)
         n_start=n;
         break;
        end
end
    %}
lwr_sample=1;
uppr_sample=s_frm+1;
            
 sz_wind_fn=s_frm+1;
 win_fn=hamming(sz_wind_fn);
    

freq_signal=zeros(FFT_size/2,noh);
spec_gram1=zeros(FFT_size/2,noh);

for n=1:noh
        
        % Read the temp data from file
        
        clear temp_data;
        temp_data=z(lwr_sample:uppr_sample);
        % Do same operation eg. FFT in this case
        temp_data=temp_data.*win_fn;
        
        mag_fft=abs(fft(temp_data,FFT_size));
       % mag_fft=mag_fft(1:FFT_size/2);
        mag_fft=mag_fft(FFT_size/2+1:FFT_size);
      % mag_fft=abs(freqz(temp_data, 1, FFT_size/2 ));
       
       
       spec_gram1(:,n)=20*log10(mag_fft);
       freq_signal(:,n)=abs(mag_fft);
       
        lwr_sample=lwr_sample+s_frm/3;
        uppr_sample=uppr_sample+s_frm/3;
        if uppr_sample>nos
            break;
        end
         
end


end

