function [db,testdb,dbids, testids] = BuildDatabase(picDir, setPrefix, setNum, picNum, dbNum, testNum, rdm)
    db = [];
    testdb = [];
    dbids = [];
    testids = [];
    
    for i = 1:setNum
        idxs = 1:picNum;
        if rdm==1
            idxs = randperm(picNum);
        else
            idxs = [1:2:picNum-1, 2:2:picNum];
        end
      
        
        dbIdx = idxs(1:dbNum);
        testIdx = idxs(dbNum+1:dbNum+testNum);
        
        for j = 1:length(dbIdx)
            picIndex = dbIdx(j);
            imagePath = PicPath(picDir, setPrefix, i, picIndex);
            image=imread(imagePath);
            image = double(image)/255;
            
            db = [db; image(:).'];
            dbids = [dbids, [i, picIndex].'];
        end
        
        for j = 1:length(testIdx)
            picIndex = testIdx(j);
            imagePath = PicPath(picDir, setPrefix, i, picIndex);
            
            image=imread(imagePath);
            image = double(image)/255;
            
            testdb = [testdb; image(:).'];
            testids = [testids, [i, picIndex].'];
        end
    end
end