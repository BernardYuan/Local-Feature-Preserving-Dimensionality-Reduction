picDir = 'ATT_Face_Database';
dirPrefix = 's';
numFace = 40;
numPic = 10;
trainNum = 7;
testNum = 3;

w = 112;
h = 92;

sizes = [1,2,4,8,16,32,64;
         1,2,4,8,16,32,64];

rdm = 1;

% experimentSets = 10;
% iterationTimes = 10;
% kdim = 1100;
% C = 9;
% rateMat = [];
% timeMat = [];
% 
% avgRateVec = [];
% bestRateVec = [];
% worstRateVec = [];
% for i = 1:experimentSets
%     [trainSet, testSet,trainIdx, testIdx] = BuildDatabase(picDir, dirPrefix, numFace, numPic, trainNum, testNum, rdm);
%     trainFeature = FeatureDatabase(trainSet, w, h, sizes);
%     testFeature = FeatureDatabase(testSet, w, h, sizes);
%     rateVec = [];
%     timeVec = [];
%     for j = 1:iterationTimes
%         disp(['set:', num2str(i), '  iter:', num2str(j)]);
%         rpm = RandomProjectionGenerator(kdim, length(sizes)*w*h, C);
%         [rate, time] = DRandClassification(trainFeature.', testFeature.', trainIdx, testIdx, rpm);
%         rateVec = [rateVec, rate];
%         timeVec = [timeVec, time];
%     end
%     rateMat = [rateMat;rateVec];
%     timeMat = [timeMat;timeVec];
%     
%     avgRateVec = [avgRateVec, mean(rateVec)];
%     bestRateVec = [bestRateVec, max(rateVec)];
%     worstRateVec = [worstRateVec, min(rateVec)];
% end

% [trainSet, testSet,trainIdx, testIdx] = BuildDatabase(picDir, dirPrefix, numFace, numPic, trainNum, testNum, rdm);
% trainFeature = FeatureDatabase(trainSet, w, h, sizes);
% testFeature = FeatureDatabase(testSet, w, h, sizes);

% [~, match11, match12] = Classifier(testSet.', trainSet.', testIdx, trainIdx);
% [~, f11] = size(match11);
% [~, f12] = size(match12);
% guideline = f11/(f11+f12);

% a = [2, 1.8, 1.7, 1.6, 1.55, 1.5, 1.4, 1.37, 1.35, 1.3, 1.32, 1.3, 1.28, 1.26, 1.24, 1.21, 1.2];

% L = [];
% rates = [];
% for i = 1:length(a)
%     sizelist = unique(floor(power(a(i), 0:log(min(w,h))/log(a(i)))));
%     length(sizelist)
%     L = [L, length(sizelist)];
% 
%     sizes = [sizelist;sizelist];
%     trainFeature = FeatureDatabase(trainSet, w, h, sizes);
%     testFeature = FeatureDatabase(testSet, w, h, sizes);
%     
%     [~, match21, match22] = Classifier(testFeature.', trainFeature.', testIdx, trainIdx);
%     [~, f21] = size(match21);
%     [~, f22] = size(match22);
%     rates = [rates, f21/(f21+f22)];
% end

% expTimes = 3;
% kdims = 100:100:3000;

% correctRate1 = [];
% timeElapse1 = [];
% 
% for k = kdims
%     disp(['Gaussian:', num2str(k)]);
%     rateG = [];
%     timeG = [];
%     for i = 1:expTimes
%         rpm = GaussianRandomMatrix(k, w*h*length(sizes));
%         [rate, time] = DRandClassification(trainFeature.', testFeature.', trainIdx, testIdx, rpm);
%         rateG = [rateG, rate];
%         timeG = [timeG, time];
%     end
%     correctRate1 = [correctRate1, max(rateG)];
%     timeElapse1 = [timeElapse1, mean(timeG)];
% end

% correctRate2 = [];
% timeElapse2 = [];
% c = 8;
% for k = kdims
%     disp(['Sparse:', num2str(k)]);
%     rateS = [];
%     timeS = [];
%     for i = 1:expTimes
%         rpm = RandomProjectionGenerator(k, length(sizes)*w*h, c);
% % %             size(rpm)
%         [rate, time] = DRandClassification(trainFeature.', testFeature.', trainIdx, testIdx, rpm);
%         rateS = [rateS, rate];
%         timeS = [timeS, time];
%     end
%     correctRate2 = [correctRate2; mean(rateS)];
%     timeElapse2 = [timeElapse2; mean(timeS)];
% end


% C = 9;
% K = 1100;
% noiseDen = 0:0.05:0.5;
% 
% expTime = 3;
% iterTime = 3;
% recMat = zeros(expTime, length(noiseDen), 3);
% for i = 1:expTime
%     [trainSet, testSet,trainIdx, testIdx] = BuildDatabase(picDir, dirPrefix, numFace, numPic, trainNum, testNum, rdm);
%     for j = 1:length(noiseDen)
%         d = noiseDen(j);
%         trainSetNoise = BuildDatabaseWNoise(trainSet, w, h, d);
%         testSetNoise = BuildDatabaseWNoise(testSet, w, h, d);
%         
%         trainFeature = FeatureDatabase(trainSetNoise, w, h, sizes);
%         testFeature = FeatureDatabase(testSetNoise, w, h, sizes);
%         
%         recVec = [];
%         for k = 1:iterTime
%             disp(['Set:', num2str(i), ' noise:', num2str(j), '  iter:', num2str(k)]);
%             rpm = RandomProjectionGenerator(K, length(sizes)*w*h, C);
%             [rate, ~] = DRandClassification(trainFeature.', testFeature.', trainIdx, testIdx, rpm);
%             recVec = [recVec, rate];
%         end
%         %best
%         recMat(i,j,1) = max(recVec);
%         %avg
%         recMat(i,j,2) = mean(recVec);
%         %worst
%         recMat(i,j,3) = min(recVec);
%     end
% end

C = 9;
K = 1100;
rotationAngle = -180:15:180;

expTime = 3;
iterTime = 3;
recMat = zeros(expTime, length(rotationAngle), 3);
for i = 1:expTime
    [trainSet, testSet,trainIdx, testIdx] = BuildDatabase(picDir, dirPrefix, numFace, numPic, trainNum, testNum, rdm);
    for j = 1:length(rotationAngle)
        angle = rotationAngle(j);
        
        trainSetRotate = BuildDatabaseWRotation(trainSet, w, h, angle);
        testSetRotate = BuildDatabaseWRotation(testSet, w, h, angle);
        
        trainFeature = FeatureDatabase(trainSetRotate, w, h, sizes);
        testFeature = FeatureDatabase(testSetRotate, w, h, sizes);

        recVec = [];
        for k = 1:iterTime
            disp(['Set:', num2str(i), ' angle:', num2str(j), '  iter:', num2str(k)]);
            rpm = RandomProjectionGenerator(K, length(sizes)*w*h, C);
            [rate, ~] = DRandClassification(trainFeature.', testFeature.', trainIdx, testIdx, rpm);
            recVec = [recVec, rate];
        end
        %best
        recMat(i,j,1) = max(recVec);
        %avg
        recMat(i,j,2) = mean(recVec);
        %worst
        recMat(i,j,3) = min(recVec);
    end
end