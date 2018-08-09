function showFace(I)
    subplot(2,5,1);
    imshow(reshape(I(1,:), 112, 92));
    subplot(2,5,2);
    imshow(reshape(I(2,:), 112, 92));
    subplot(2,5,3);
    imshow(reshape(I(3,:), 112, 92));
    subplot(2,5,4);
    imshow(reshape(I(4,:), 112, 92));
    subplot(2,5,5);
    imshow(reshape(I(5,:), 112, 92));
    
    subplot(2,5,6);
    imshow(reshape(I(6,:), 112, 92));
    subplot(2,5,7);
    imshow(reshape(I(7,:), 112, 92));
    subplot(2,5,8);
    imshow(reshape(I(8,:), 112, 92));
    subplot(2,5,9);
    imshow(reshape(I(9,:), 112, 92));
    subplot(2,5,10);
    imshow(reshape(I(10,:), 112, 92));    
end