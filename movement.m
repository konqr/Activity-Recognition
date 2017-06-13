function [I, theta1] = movement(fileName)    
    fid = fopen(fileName);
    tline = zeros;
    while 1,
      t = fgets(fid);
       if t < 0,
        break;
        end
      tline = horzcat(tline,str2num(t));
    end
    tline = tline(2:length(tline));
    tline = reshape(tline, [4,length(tline)/4]);
    tline = tline';
    tline = reshape(tline, [prod(size(tline))/80,20,4]);
    x = reshape(tline(:,:,1), 20,prod(size(tline))/80);
    y = reshape(tline(:,:,2), 20,prod(size(tline))/80);
    z = reshape(tline(:,:,3), 20,prod(size(tline))/80);
    
    factor = [];
    for i = 1:20,
        joint = [x(i,:)',y(i,:)',z(i,:)'];
        factor = horzcat(factor, trace(cov(joint)));
    end
    [M, I] = max(factor);
    mmj = [x(I,:);y(I,:);z(I,:)];
    theta = atan2(mmj(2,:),mmj(1,:));
    x = round(linspace(1,length(theta),20));
    theta1 = theta(x);
%     figure
    plot(theta(x));
    fclose(fid);
end   
    