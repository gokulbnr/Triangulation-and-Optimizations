function [f,vp]=getf(im)
    im=imread(im);
    [~,~,si]=size(im);
    if si>1
        im=rgb2gray(im);
    end
    im=im2double(im);
    p=detectSURFFeatures(im);
    [f,vp]=extractFeatures(im,p);
end