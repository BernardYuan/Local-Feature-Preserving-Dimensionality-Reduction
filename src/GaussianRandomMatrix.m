function [rpm] = GaussianRandomMatrix(k, L)
    rpm = normrnd(0,1,[k,L])/sqrt(k);
end