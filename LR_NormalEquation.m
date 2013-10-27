function [] = LR_NormalEquation(Xtrain, Ytrain, Xtest, Ytest)
    
    [model] = LR_NormalEquation_train(Xtrain, Ytrain);
    [Ypred_NE] = LR_test(model, Xtest);
     
    error = norm(Ypred_NE - Ytest);
    
    save Ypred_NE.mat Ypred_NE;
    fprintf('Error = %.3f\n', error);
end