function [mask] = MaskGenerator(x, y, Iw, Ih, w, h)
    mask = sparse(Iw, Ih, 'uint8');
    
    xEnd = x + w - 1;
    yEnd = y + h - 1;
    mask(x:xEnd, y:yEnd) = 1;
end