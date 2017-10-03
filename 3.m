%% 3a
clc;
clear all;
close all;
load mandrill;
figure
i=imshow(X,map);
title('original mandrill image')
i=ind2gray(X,map);
i=i(1:128,120:120+256-1);
figure
imshow(i);
title('resized mandrill image')
load hlp1;   %low pass filter of order 1
f=filter2(h,i);
f=mat2gray(f);
figure
imshow(f);
title('frequency function of low pass filter of order 1')
load hlp2;   %low pass filter of order 2
f1=filter2(h,i);
f1=mat2gray(f1);
figure
imshow(f1);
title('frequency function of low pass filter of order 2')
load hhp1;   %high pass filter of order 1
f2=filter2(h,i);
f2=mat2gray(f2);
figure
imshow(f2);
title('frequency function of high pass filter of order 1')
load hhp2;   %high pass filter of order 2
f3=filter2(h,i);
f3=mat2gray(f3);
figure
imshow(f3);
title('frequency function of high pass filter of order 2')
load hk;    % unknown filter
f4=filter2(h,i);
f4=mat2gray(f4);
figure
imshow(f4);
title('frequency function of unknown filter')

%% 3b
clc;
clear all;
close all;
load mandrill;
figure
imshow(X,map);
title('original mandrill image')
i=ind2gray(X,map);
i=i(1:128,120:120+256-1);
figure
imshow(i);
title('resized mandrill image')
N1=128;
N2=256;
n1=(0:N1-1)'*ones(1,N2);
n2=ones(N1,1)*(0:N2-1);
w1= 2*pi*8/32;
w2= 2*pi*16/32;
x=cos((w1*n1)+(w2*n2)) % creating a cosine signal
i1=i+x;    % adding cosine disturbance to the index
figure
i1=mat2gray(i1);
imshow(i1);
title('noisy image')
load hlp1;    %low pass filter of order 1
f1=filter2(h,i1);
f1=mat2gray(f1);
figure
imshow(f1);
title('low pass filtered image of order 1')
load hlp2;    %low pass filter of order 2
f2=filter2(h,i1);
f2=mat2gray(f2);
figure
imshow(f2);
title('low pass filtered image of order 2')
load hhp1;   %high pass filter of order 1
f3=filter2(h,i1);
f3=mat2gray(f3);
figure
imshow(f3);
title('high pass filtered image of order 1')
load hhp2;   %high pass filter of order 2
f4=filter2(h,i1);
f4=mat2gray(f4);
figure
imshow(f4);
title('high pass filtered image of order 2')
load hk;    % unknown filter
f5=filter2(h,i1);
f5=mat2gray(f5);
figure
imshow(f5);
title('unknown filtered ')
%% 3c
clc;
clear all;
close all;
load hbrus;   % filter
N1=128;
N2=256;
n=filter2(h,rand(N1,N2)) %image-noise
N_1=fft2(n);
N_1=mat2gray(N_1);
figure
imshow(N_1)
title('noisy image')
load mandrill;
figure
i=imshow(X,map);
title('original mandrill image')
i=ind2gray(X,map);
i=i(1:128,120:120+256-1);
figure
imshow(i);
title('resized mandrill image')
i1=i+n;
i1=mat2gray(i1);
figure
imshow(i1);
title('noise added to the resized mandrill image')
load hlp1;    %low pass filter of order 1
f1=filter2(h,i1);
f1=mat2gray(f1);
figure
imshow(f1);
title('image restoration using low pass filter of order 1')
load hlp2;   %low pass filter of order 2
f2=filter2(h,i1);
f2=mat2gray(f2);
figure
imshow(f2);
title('image restoration using low pass filter of order 2')
load hhp1;   %high pass filter of order 1
f3=filter2(h,i1);
f3=mat2gray(f3);
figure
imshow(f3);
title('image restoration using high pass filter of order 1')
load hhp2;   %low pass filter of order 2
f4=filter2(h,i1);
f4=mat2gray(f4);
figure
imshow(f4);
title('image restoration using high pass filter of order 2')
load hk;    %unknown filter
f5=filter2(h,i1);
f5=mat2gray(f5);
figure
imshow(f5);
title('image restoration using unknown filter')









