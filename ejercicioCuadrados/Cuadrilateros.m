img=imread('test.bmp');
imgy=rgb2gray(img);
thresh = graythresh(imgy);
maskBW = imbinarize(imgy, thresh);
maskBW = imcomplement(maskBW);

%%
clc
[B L]=bwboundaries(maskBW,'noholes');
figure(6);
imshow(label2rgb(L,@hsv,[0.2 0.8 0.8]));
hold on
for k=1:length(B)
    boundary=B{k};
    plot(boundary(:,2),boundary(:,1),'w','Linewidth',1);
end

datosImg=regionprops(L,'Area','Centroid','Perimeter','BoundingBox','Extent');   
pUmbral=0.859;
for k=1:length(B)
    fig=uint8(abs(datosImg(k).BoundingBox(3)-datosImg(k).BoundingBox(4))<0.1);
    fig=fig+2*uint8((datosImg(k).Extent-1)==0);
    if fig>=2
        centroide=datosImg(k).Centroid;
        text(centroide(1)-15,centroide(2)+13, num2str(datosImg(k).Area));        
        plot(centroide(1),centroide(2),'bs-');
    end
end
