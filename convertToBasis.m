function [basisMat] = convertToBasis(inputMat)
    s=size(inputMat);
    count = s(1,1);
    
    intercept = zeros(count,1) + 1;
    basisMat = [intercept inputMat inputMat.^2 inputMat.^3 inputMat.^4 inputMat.^5 sin(inputMat) cos(inputMat)];
    %basisMat = [intercept inputMat inputMat.^2 inputMat.^3 inputMat.^4 inputMat.^5 sin(inputMat) cos(inputMat) sinh(inputMat) cosh(inputMat)];
    %basisMat = [intercept sin(inputMat) cos(inputMat)];
end