function [featureMatrix] = FeatureDatabase(db, w, h, sizes)
    [numPic,dimPic] = size(db);
    featureMatrix = [];

    for i = 1:numPic
        img = reshape(db(i,:), w, h);
        featureVector = [];
        for j = 1:length(sizes)
            mask = ones(sizes(1,j), sizes(2,j));
            feature = conv2(img, mask, 'same');
            featureVector = [featureVector, feature(:).'];
        end
        featureMatrix = [featureMatrix; featureVector];
    end
end