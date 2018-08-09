function [distMat, matched, unmatched] = Classifier(testFeature, trainFeature, testIdx, trainIdx)
    [~,numTest] = size(testFeature);
    [~,numTrain] = size(trainFeature);
    
    distMat = zeros(numTest, numTrain);
    
    for i = 1:numTest
        for j = 1:numTrain
            dist = norm(testFeature(:,i)-trainFeature(:,j));
            distMat(i,j) = dist;
        end
    end
    
    [minValue, minIndex] = min(distMat, [], 2);
    
    minIndex = minIndex.';
    
    matched = [];
    unmatched = [];
    
    for i = 1:length(minIndex)
        idx = minIndex(i);
        
        testFace = testIdx(1, i);
        trainFace = trainIdx(1, idx);
        
        if testFace == trainFace
            matched = [matched, [i, idx].'];
        else 
            unmatched = [unmatched, [i, idx].'];
        end
    end
end