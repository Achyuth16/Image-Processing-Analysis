%% 2a
clc;
clear all;
close all;
    
n=input('enter the n value');
m=input('enter the m value');
 N1=2^n;       
 N2=2^n;        
 n1=0:N1-1;   
 n2=0:N2-1;
 
 j=sqrt(-1);
 x=randi(10,N1,N2);   
 for k1=1:N1       
     F1(k1,:)=exp(-j*(2*pi/N1)*(k1-1)*n1); %obtained F1 matrix
 end
for k2=1:N2
    F2(:,k2)=exp(-j*(2*pi/N2)*(k2-1)*n2'); %obtained F2 matrix
end
 X=(F1*x*F2) %theoreotical DFT values in frequency domian
Xf=fft2(x)   %DFT using matlab
%% 2b
        
N11=8; N21=8;
x1=ones(N11,N21);
X1=fft2(x1,64,64)   
axis=-pi:2*pi/63:pi;
colormap('default')
figure
mesh(axis,axis,20*log10(abs(fftshift(X1'))+0.01)) % the constant 0.01 will render a floor at -40 DB
xlabel('\omega_1')
ylabel('\omega_2')
title('Fourier transform of 2-D window w(n1,n2) plot in 3-D')
%% 2-d plot
colormap(jet(64))
imagesc(20*log10(abs(fftshift(X1))+0.01)) % will put the origin of frequency in the top left corner
colorbar
colormap('default')
xlabel('\omega_3')
ylabel('\omega_4')
title('2-D plot')
%% with filter 
load hhp1;
X2=fft2(h,64,64)
axis=-pi:2*pi/63:pi;
colormap('default')
figure
mesh(axis,axis,20*log10(abs(fftshift(X2'))+0.01)) % the constant 0.01 will render a °oor at -40dB
xlabel('\omega_1')
ylabel('\omega_2')
title('3-D plot with filter')
colormap(jet(64))
figure
imagesc(20*log10(abs(fftshift(X2))+0.01)) % will put the origin of frequency in the top left corner
colorbar
colormap('default')
xlabel('\omega_3')
ylabel('\omega_4')
title('2-D plot with filter')
%% 2c
N1=64;
N2=64;
n1=(0:N1-1)'*ones(1,N2);
n2=ones(N1,1)*(0:N2-1);
w1= 2*pi*8/64;
w2= 2*pi*16/64;
w3= 2*pi*8.5/64;
w4= 2*pi*16.5/64;
x=cos(w1*n1+w2*n2);   % cosine signal with frequencies w1,w2
x1=cos(w3*n1+w4*n2);  % cosine signal with frequencies w3,w4
figure
subplot(2,1,1)
imshow(x);
title('plot of cosine signal with frequencies w1&w2 ')
X=fft2(x,64,64);
subplot(2,1,2)
imshow(x1);
title('plot of cosine signal with frequencies w3&w4 ')
X1=fft2(x1,64,64);
axis=-pi:2*pi/63:pi;
figure,subplot(1,2,1);
mesh(axis,axis,20*log10(abs(fftshift(X)+0.01)));   % plotting in 3-D for first cosine signal
xlabel('\omega_1');
ylabel('\omega_2');
title('3-D plot for first cosine signal')
subplot(1,2,2);
mesh(axis,axis,20*log10(abs(fftshift(X1)+0.01)));  % plotting in 3-D for second cosine signal
xlabel('\omega_3');
ylabel('\omega_4');
title('3-D plot for second cosine signal')
%% 2ca
N1=8;
N2=8;
n1=(0:N1-1)'*ones(1,N2);
n2=ones(N1,1)*(0:N2-1);
w1= 2*pi*1/64;
w2= 2*pi*2/64;
x=cos(w1*n1+w2*n2);
figure
imshow(x);
title('plot of cosine signal with frequencies w1&w2 ')
X=fft2(x,64,64);
axis=-pi:2*pi/63:pi;
figure,subplot(1,2,1);
mesh(axis,axis,20*log10(abs(fftshift(X)+0.01)));   % plotting in 3-D for cosine signal
xlabel('\omega_1');
ylabel('\omega_2');
title('3-D plot for cosine signal')
subplot(122)
imagesc(20*log10(abs(fftshift(X)+0.01)));    % plotting in 2-D for cosine signal
xlabel('\omega_3');
ylabel('\omega_4');
title('2-D plot for cosine signal')
%% 2cb
N1=16;
N2=16;
n1=(0:N1-1)'*ones(1,N2);
n2=ones(N1,1)*(0:N2-1);
w1= 2*pi*2/64;
w2= 2*pi*4/64;
x=cos(w1*n1+w2*n2);
figure
imshow(x);
title('plot of cosine signal with frequencies w1&w2 ')
X=fft2(x,64,64);
axis=-pi:2*pi/63:pi;
figure,subplot(1,2,1);
mesh(axis,axis,20*log10(abs(fftshift(X)+0.01)));   % plotting in 3-D for cosine signal
xlabel('\omega_1');
ylabel('\omega_2');
title('3-D plot for cosine signal')
subplot(122)
imagesc(20*log10(abs(fftshift(X)+0.01)));    % plotting in 2-D for cosine signal
xlabel('\omega_3');
ylabel('\omega_4');
title('2-D plot for cosine signal')
%% 2d
load mandrill;
figure
i=imshow(X,map);
title('original mandrill image')
i=ind2gray(X,map);
i=i(1:128,120:120+256-1);  
figure
imshow(i);
title('resized mandrill image')
ib=fft2(i).*exp(1j*2*pi*rand(128,256));  % 2-DFT
ib=real(ifft2(ib));                      %inverse 2-DFT
ib=mat2gray(ib);                         %converting matrix to gray
figure
imshow(ib);                                              
title('removed phase part');
i_f=fft2(i)./abs(fft2(i));       % element wise division with ampliitude function
i_f=real(ifft2(i_f));
i_f=mat2gray(i_f);
figure
imshow(i_f);
title('removed amplitude part');




