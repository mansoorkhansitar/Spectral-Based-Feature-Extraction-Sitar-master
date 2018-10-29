function [ centroid,width,skew,kurtosis ] = spectral_features( freq_signal,noh,FFT_size,e1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x=zeros(1,4);
y=zeros(1,noh);
centroid=zeros(1,noh);
width=zeros(1,noh);
skew=zeros(1,noh);
kurtosis=zeros(1,noh);

for i=1:noh
    t=freq_signal(:,i);
                for j=1:FFT_size/2
                y(i)=y(i)+freq_signal(j,i);
                freq_signal(j,i)=t((FFT_size/2)-j+1);
                end
end
%K=-24.95395;
K=0;
%y=0;
for i=1:noh
   % if max(freq_signal(:,i))>1
          for k=1:4
               for j=1:FFT_size/2
                %y=y+freq_signal(j,i);
                x(k)=x(k)+((j^k)*freq_signal(j,i)); % Moments calculated here
               end
                %x(k)=x(k)/y(i);
                %y=0;
          end
          x=x/y(i);
          centroid(i)=x(1);
          width(i)=(x(2)-x(1)^2)^(0.5);  % Features computed using the moments
          skew(i)=(2*(x(1)^3)-3*(x(1)*x(2))+x(3))/(width(i)^3);
          kurtosis(i)=(((-3)*(x(1)^4)+6*(x(1)*x(2))-4*(x(1)*x(3))+x(4))/(width(i)^4))-K;
   %  end
          x=zeros(1,4);
          
end


for i=1:noh
   if e1(i)==0
    centroid(i)=0;
    width(i)=0;
    skew(i)=0;
    kurtosis(i)=0;
   end
end

%


end

