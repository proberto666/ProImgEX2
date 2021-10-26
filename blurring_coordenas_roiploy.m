%% Limpiar variables
clear all
clc
%% 
im =imread('ante.jpeg');
tat = imread('./ejercicioTatu/Tatuaje.png');
figure(1)
imshow(im)
%%
C=[609.5; 1059.5;  1059.5; 609.5];
R=[ 687.5; 875.5;  687.5 ; 875.5;];
BW1=roipoly(im,C,R);
C=[609.5; 1059.5;   609.5;1059.5];
R=[ 687.5; 875.5;   875.5;687.5 ];
BW2=roipoly(im,C,R);

FBW=imadd(BW1,BW2);

figure(2)
imshow(FBW);
w=3

windowsize = w;
H = ones(windowsize,windowsize)/windowsize^2; %mantener linealidad
F2= roifilt2(H,im,BW);% El blurring en cierta area
figure(3)
imshow(F2)