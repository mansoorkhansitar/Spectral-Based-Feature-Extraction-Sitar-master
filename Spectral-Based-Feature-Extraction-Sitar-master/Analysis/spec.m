function [ centroid,width,skew,kurtosis,p,m,S ] = spec( X,FFT_size,fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%S=abs(freqz(X, 1, FFT_size/2 ));
S=abs(fft(X,FFT_size));
S=S(1:FFT_size/2);
x=zeros(1,4);
y=0;
K=0;
%K=-24.95395;
%[ centroid,width,skew,kurtosis,u,v,range_spectra ] = spectral_features( freq_signal,noh,FFT_size,e1 );
          for k=1:4
               for j=1:length(S)
                y=y+S(j);
                x(k)=x(k)+((j^k)*S(j));
               end
                x(k)=x(k)/y;
                y=0;
          end
          
          centroid=x(1);
          width=(x(2)-x(1)^2)^(0.5);
          skew=(2*(x(1)^3)-3*(x(1)*x(2))+x(3))/(width^3);
          kurtosis=(((-3)*(x(1)^4)+6*(x(1)*x(2))-4*(x(1)*x(3))+x(4))/(width^4))-K;
          [KT,M]=impulse_template(FFT_size/2,fs);
          
           
          [~,m]=max(S);
                 
             y=KT*S;
          [~,I]=max(y);
          p=M(I);
          %  t=S;
           %     for j=1:FFT_size/2
            %    S(j)=t((FFT_size/2)-j+1);
             %   end
          
end

