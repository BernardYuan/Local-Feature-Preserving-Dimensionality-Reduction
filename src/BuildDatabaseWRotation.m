function [db] = BuildDatabaseWRotation(I, w, h, a)
    db = [];
    [numPic, numDim] = size(I);
    
    for i = 1:numPic
        image = reshape(I(i,:), w, h);
        image = imrotate(image, a, 'crop');
        db = [db;image(:).'];
    end
end