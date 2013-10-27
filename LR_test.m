function [Ypred] = LR_test(model, Xtest)
        
    theta = model;
    
    myXtest = convertToBasis(Xtest);
    Ypred = (myXtest)*(theta');
end
