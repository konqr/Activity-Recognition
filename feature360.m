function [dist360] = feature360(fileName)
    [dist, theta, data] = oneDimFigure(fileName);
    dist360 = []; theta360 = [];
    for i=-180:180,
       [c index] = min(abs(data(:,2)-i));
       dist360 = horzcat(dist360, data(index,1));
       theta360 = horzcat(theta360, data(index,2));
    end