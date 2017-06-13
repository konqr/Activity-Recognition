function [dist, theta, data] = oneDimFigure(fileName)
  [k, polygon] = convexHull(fileName);
  polygon_boundary = [polygon(k,1),polygon(k,2),polygon(k,3)];
  centroid = [mean(polygon_boundary(:,1));mean(polygon_boundary(:,2));mean(polygon_boundary(:,3))];
  p_x = []; 
  p_y = [];
  for i = 1:length(polygon_boundary)-1,
      x = linspace(polygon_boundary(i,1),polygon_boundary(i+1,1));
      coeff = polyfit([polygon_boundary(i,1),polygon_boundary(i+1,1)],[polygon_boundary(i,2),polygon_boundary(i+1,2)], 1);
      p_x = horzcat(p_x,x);
      p_y = horzcat(p_y,x.*coeff(1) + coeff(2));
  end;
  dist = sqrt((p_x-centroid(1)).^2 + (p_y-centroid(2)).^2);
  theta = atan2(p_y-centroid(2),p_x-centroid(1));
  theta = theta * (180/pi);
  data = [dist',theta'];
  
  %plot(theta, dist, 'r.');
  