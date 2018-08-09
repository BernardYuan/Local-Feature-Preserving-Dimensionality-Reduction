function [corRate, time] = DIRecognizer1(picDir, dirPrefix, numFace, numPic, w, h, trainNum, testNum, maskSizes, k, rdm)
tic;
    [trainSet, testSet, trainIdx, testIdx] = BuildDatabase(picDir, dirPrefix, numFace, numPic, trainNum, testNum, rdm);

%     rpm = RandomProjectionGenerator(k, length(sizes)*w*h, 5);
    rpm = GaussianRandomMatrix(k, length(maskSizes)*w*h);
    
    trainFeature = FeatureDatabase(trainSet, w, h, maskSizes);
    testFeature = FeatureDatabase(testSet, w, h, maskSizes);
    
    trainFeature = rpm*(trainFeature.');
    testFeature = rpm*(testFeature.');
    
    [distMat, matched, unmatched] = Classifier(testFeature, trainFeature, testIdx, trainIdx);
    [~, matchedFaces] = size(matched);
    [~, unmatchedFaces] = size(unmatched);
    
    corRate = matchedFaces/(matchedFaces+unmatchedFaces);
    time = toc;
end

