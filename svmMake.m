function [acc] = svmMake()
fid = fopen('results_linear_all.txt','w');
acc = [];
    
    for a = 1:20,
        for b = 1:20,
            if a == b, continue; end
            Z = boundaryMake(a,b);
            exp = Z(:,2:383);
            pred = Z(:,1);
            [~, scores] = pca(exp); 
            SVMmodel = fitclinear(scores,pred, 'Kfold', 5);
            error = kfoldLoss(SVMmodel);
            accuracy = 100*(1-error)
            acc = horzcat(acc, accuracy);
            fprintf(fid,'%d vs %d: %f \r\n', a, b, accuracy);
        end
    end
    fprintf(fid, 'average accuracy = %f', mean(acc));
end
