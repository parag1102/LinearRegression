function [] = LR_LMS(Xtrain, Ytrain, Xtest, Ytest)
    
    [model] = LR_LMS_train(Xtrain, Ytrain);
    [Ypred_LMS] = LR_test(model, Xtest);
     
    error = norm(Ypred_LMS - Ytest);
    
    save Ypred_LMS.mat Ypred_LMS;
    fprintf('Error = %.3f\n', error);
end