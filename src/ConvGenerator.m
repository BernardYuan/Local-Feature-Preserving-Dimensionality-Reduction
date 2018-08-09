function [convMat] = ConvGenerator(imageW, imageH, maskWs, maskHs)
    lMaskWs = length(maskWs);
    lMaskHs = length(maskHs);

    % pre-allocate the space for the projection matrix for DI
    convMat = zeros(imageW*imageH*lMaskWs*lMaskHs, imageW*imageH, 'uint8');
    idxConv = 1;
    
    for wIndex = 1:lMaskWs
        for hIndex = 1:lMaskHs
            w = maskWs(wIndex);
            h = maskHs(hIndex);
            for i = 1:imageW
                for j = 1:imageH
                    if ((i+w-1 > imageW) || (j+h-1>imageH))
                        continue
                    end
                    mask = MaskGenerator(i, j, imageW, imageH, w, h);
                    convMat(idxConv, :) = mask(:).';
                    idxConv = idxConv+1;
                end
            end
        end
    end
    
    % remove all the zero rows
    convMat = convMat(1:(idxConv-1), :);
end