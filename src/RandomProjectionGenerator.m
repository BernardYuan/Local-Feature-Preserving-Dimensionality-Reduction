function [RPMatrix] = RandomProjectionGenerator(n, L, c)
    RPMatrix = zeros(n, L);
    v = sqrt(L/c);
    for i = 1:n
        colIdx = randperm(L, c);
        for j = colIdx
            label = rand(1);
            if label > 0.5
                RPMatrix(i,j) = v;
            else 
                RPMatrix(i,j) = -v;
            end       
        end
    end
end