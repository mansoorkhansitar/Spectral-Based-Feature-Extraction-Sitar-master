function [ K,M] = impulse_template(d_size,fs)
%define all frequencies of frets
A1=55;
M=zeros(60);
M(1)=A1;
for i=2:60
    M(i)=2^(1/12)*M(i-1);
end

%group them in a matrix

%M=[D2 E2m E2 F2 F2m G2 G2m A3 B3m B3 C3 C3m D3 E3m E3 F3 F3m G3 G3m A4 B4m B4 C4 C4m D4 Eb4 E4 F4 F4m G4 G4m A5 Bb5 B5 C5 C5m D5 E5m E5 F5 F5m G5];
N=zeros(60,8);
K=zeros(60,d_size);
%form a matrix after computation from NT(number of templates),f(frequency) to NT,bin
for i=1:60
   for j=1:4   
    N(i,j)=j*M(i);    %for forming harmonics
   t=round(d_size*(2/fs)*N(i,j));
   K(i,t)=exp(-0.005*t);
           
   end
end

end

