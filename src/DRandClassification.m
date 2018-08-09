function [rate, time] = DRandClassification(trainFeature, testFeature, trainIdx, testIdx, rpm)
tic;
    trF = rpm * trainFeature;
    ttF = rpm * testFeature;
    
    [distMat, matched, unmatched] = Classifier(ttF, trF, testIdx, trainIdx);
    [~, matchedFaces] = size(matched);
    [~, unmatchedFaces] = size(unmatched);
%     disp(matchedFaces)
%     disp(unmatchedFaces)
    rate = matchedFaces / (matchedFaces + unmatchedFaces);
time = toc;
end