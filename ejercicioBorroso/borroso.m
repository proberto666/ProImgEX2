img=im2double(imread('Borrosa.jpg'));
%% 
PSF=fspecial('motion',25,25);
final = deconvwnr(img,PSF,.001);
figure(1);
imshow(final);
        