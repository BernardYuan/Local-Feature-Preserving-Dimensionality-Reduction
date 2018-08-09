function picPath = PicPath(dbDir, setPrefix, setID, picID)
    subFolder = strcat(setPrefix,num2str(setID));
    fileName = strcat(num2str(picID), '.pgm');
    picPath = fullfile(dbDir, subFolder, fileName);
end