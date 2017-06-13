function [Z] = boundaryMake(a,b)
    fileNames = []; index = []; Z = [];
    for i = [a,b],
        for j = 1:10,
            for k = 1:3,
                fileNames =sprintf('a%02i_s%02i_e%02i_skeleton3D.txt',i,j,k);
                fid = fopen(fileNames);
                if fid ~= -1,
                fclose(fid);
                name1 = strcat('A:\Work\Acad\Intern\fig_msr\polygon_',fileNames,'.png');
                z = feature360(fileNames);
                [I, theta] = movement(fileNames);
                z = horzcat(i, z, I, theta);
                Z = vertcat(Z, z);
%                 if any(i==[2,3,5,6,10,13,18,20]),
%                     a = z;
%                     a = horzrcat(1,a);
%                     Z = vertcat(Z,a);
%                 end
%                 if any(i==[1,4,7,8,9,11,14,12]),
%                     b= z;
%                     b = horzcat(2,b);
%                     Z = vertcat(Z,b);
%                 end    
%                 if any(i==[6,14,15,16,17,18,19,20]), 
%                     c = z;
%                     c = horzcat(3,c);
%                     Z = vertcat(Z,c);
%                 end
                %saveas(gcf, name1);
                
                end
            
            end
        end
    end
end
