function [featureMatrix] = FourierFeatureDatabase(db, w, h)
    [numPic, numDim] = size(db);

    featureMatrix = [];
    for i = 1:numPic
        img = reshape(db(i,:), w, h);
        featureVector = FourierFeatureExtraction(img);
        
        featureMatrix = [featureMatrix;featureVector];
    end
end