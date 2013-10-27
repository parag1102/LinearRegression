function [model] = LR_LMS_train(Xtrain, Ytrain)
    
    myXtrain = convertToBasis(Xtrain);
    
    s=size(myXtrain);
    countTrainEg = s(1,1);
    dim = s(1,2);
    
    %theta =  [-9.9830   81.4960    2.7623   -4.8953   -0.4588    0.6395  -50.0593    8.9862  -26.0053    3.3697];
    theta = [3.4060 -11.9550 -0.3748 1.7052 0.0179 -0.0506 17.8041 -1.1822];
    %theta = [1.7914 2.5821 0.3141 -0.4218 -0.0152 0.0148 2.5300 0.5609];
    %theta=zeros(1,dim)-1;
    alpha = 10^(-7);%0.00000238;
    
    maxIterations = 1000;%10000;
    T = 0;
    
    [Ypred_LMS] = LR_test(theta, Xtrain);
    error_old = norm(Ypred_LMS - Ytrain);
    
    %fprintf('First Error: %f\n', error_old);
    while (true && (T<maxIterations))
        
        BeforeShuffle = [Ytrain, myXtrain];
        Shuffled = BeforeShuffle(randperm(size(BeforeShuffle,1)),:);
        ShufflemyYtrain = Shuffled(:, 1);
        ShufflemyXtrain = Shuffled(:, 2:dim + 1);

        for m=1:countTrainEg
            for ind3 = 1:dim
                myVar = ( ShufflemyYtrain(m,1)-(ShufflemyXtrain(m,:)*(theta')) )*ShufflemyXtrain(m,ind3);
                theta(1,ind3) = theta(1,ind3) + alpha*myVar;
            end
        end

        LR_test(theta, Xtrain);
        [Ypred_LMS] = LR_test(theta, Xtrain);
        error_new = norm(Ypred_LMS - Ytrain);
        
        %fprintf('Error_new: %f , Diff: %f\n', error_new, abs(error_new-error_old));
        if( abs(error_new - error_old) < (10^(-9)) )
            break;
        else
            error_old=error_new;
            T=T+1;
        end
    end
    %fprintf('no. of iterations %d\n', T);
    [model] = theta;
end