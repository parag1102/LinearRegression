function [model] = LR_SteepestDescent_train(Xtrain, Ytrain)
    
    myXtrain = convertToBasis(Xtrain);
    
    s=size(myXtrain);
    m = s(1,1);
    dim = s(1,2);
    
    %theta =  [-9.9830   81.4960    2.7623   -4.8953   -0.4588    0.6395  -50.0593    8.9862  -26.0053    3.3697];
    theta = [3.4060 -11.9550 -0.3748 1.7052 0.0179 -0.0506 17.8041 -1.1822];
    %theta = [1.7914 2.5821 0.3141 -0.4218 -0.0152 0.0148 2.5300 0.5609];
    %theta=zeros(1,dim)-1;
    alpha = 10^(-7);%0.00000238;
    
    maxIterations = 1000000;%10000;
    T = 0;
    
    [Ypred_SD] = LR_test(theta, Xtrain);
    error_old = norm(Ypred_SD - Ytrain);
    
    %fprintf('First Error: %f\n', error_old);
    while (true && (T<maxIterations))
        tempsum=zeros(1,dim);
        for ind = 1:m
            tempsum = tempsum + (( Ytrain(ind,1) - (myXtrain(ind,:)*(theta')) ).*myXtrain(ind,:));
        end
        myVar = alpha.*tempsum;
        theta = theta + myVar;
        
        LR_test(theta, Xtrain);
        [Ypred_SD] = LR_test(theta, Xtrain);
        error_new = norm(Ypred_SD - Ytrain);
        
        %fprintf('Error_new: %f , Diff: %f\n', error_new, abs(error_new-error_old));
        if( abs(error_new - error_old) < (10^(-9)) )
            break;
        else
            error_old=error_new;
            T=T+1;
        end
    end
    
    [model] = theta;
    %fprintf('no. of iterations %d\n', T);
end