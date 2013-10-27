function [] = LR_SteepestDescent(Xtrain, Ytrain, Xtest, Ytest)
       
    [model] = LR_SteepestDescent_train(Xtrain, Ytrain);
    [Ypred_SD] = LR_test(model, Xtest);
     
    error = norm(Ypred_SD - Ytest);
    
    save Ypred_SD.mat Ypred_SD;
    fprintf('Error = %.3f\n', error);
end