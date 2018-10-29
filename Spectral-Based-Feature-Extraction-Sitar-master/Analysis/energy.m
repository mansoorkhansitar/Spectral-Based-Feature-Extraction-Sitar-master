function [ e,e1 ] = energy( spec_gram,noh,size )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 e=zeros(1,noh);
  e1=zeros(1,noh);
     for i=1:noh
         sumt=0;
         temp=spec_gram(:,i);
         for j=1:(size/2)
             sumt=sumt+(temp(j).*temp(j));          %for finding the energy
         end
         e(i)=2*sumt;
        
     end

      ethresh=0.01*max(e);
       
     for i=1:noh
      if e(i)>ethresh
         e1(i)=1;
      else
         e1(i)=0; 
      end
     end
     
     
     
     
     
end

