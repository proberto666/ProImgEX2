img=imread('test.bmp');
imgy=rgb2gray(img);
thresh = graythresh(imgy);
maskBW = imbinarize(imgy, thresh);
maskBW = imcomplement(maskBW);

%%
[B L]=bwboundaries(maskBW,'noholes');
figure(6);
imshow(label2rgb(L,@jet,[0.2 0.8 0.8]));
hold on
for k=1:length(B)
    boundary=B{k};
    plot(boundary(:,2),boundary(:,1),'w','Linewidth',1);
end

datosImg=regionprops(L,'all','Area','Centroid');   
pUmbral=0.859;
for k=1:length(B)
    
    w=datosImg(k).BoundingBox
    fronteras=B{k};
    
    delta=diff(fronteras).^2;
    perimetro=datosImg(k).Perimeter;
    area=datosImg(k).Area;
    cuadrado=[perimetro.^2]./(4*pi*[area]);
    etiquetas=sprintf('%2.2f',cuadrado);
    plot(k);
    if cuadrado<1.53 && cuadrado > 1.19
        centroide=datosImg(k).Centroid;
        plot(centroide(1),centroide(2),'k o');
    end
end