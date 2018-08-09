function [db] = BuildDatabaseWNoise(I, w, h, d)
    db = [];
    [numPic, numDim] = size(I);
    
    for i = 1:numPic
        image = reshape(I(i,:), w, h);
        image = imnoise(image, 'salt & pepper', d);
        db = [db;image(:).'];
    end
end