function [featureVector] = FeatureExtraction(img, sizes)
    featureVector = [];
    %include the original picture in the feature vector
%     featureVector = [featureVector;img];
    
    len = length(sizes);
    
    for i = 1:len
        mask = ones(sizes(1,i), sizes(2,i));
%         mask = mask / (sizes(1,i) * sizes(2,i));
        feature = conv2(img, mask, 'same');
        featureVector = [featureVector;feature];
    end
    featureVector = featureVector(:);
end