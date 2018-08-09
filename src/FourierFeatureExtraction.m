function featureVector = FourierFeatureExtraction(I)
    fI = fft2(I);
    realI = real(fI);
    imagI = imag(fI);
    featureVector = [];

    featureVector = [featureVector, realI(1,1:5), realI(2, 1:4), realI(3, 1:3), realI(4, 1:2), realI(5, 1)];
    featureVector = [featureVector, imagI(1,1:5), imagI(2, 1:4), imagI(3, 1:3), imagI(4, 1:2), imagI(5, 1)];
end