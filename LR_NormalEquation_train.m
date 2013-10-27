function [model] = LR_NormalEquation_train(Xtrain, Ytrain)
    
    myXtrain = convertToBasis(Xtrain);
    
    myXtrainT = myXtrain';
    tempMat = inv(myXtrainT*myXtrain);
    theta = tempMat*(myXtrainT*Ytrain);
    
    [model] = theta';
end
    