function [k, polygon] = convexHull(fileName)
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
    frames=[1,fix(length(tline)/160),length(tline)/80];
    polygon  = []; k = [];
    figureTitle = strcat(fileName(1:10),'Polygon');
    %figure
    %hold on
      for i=1:length(frames),
         k = 80*(frames(i)-1)+1;
         element = tline(k:k+79);
         element = reshape(element,[4,20]);
         polygon = vertcat(polygon,element([1,2,3],:)');
      end;
     k = boundary(polygon(:,1),polygon(:,2));
    %plot3(polygon(:,1),polygon(:,2),polygon(:,3),'b.', 'MarkerSize', 15);
    %plot3(polygon(k,1),polygon(k,2),polygon(k,3),'r-', 'MarkerSize', 15);
%     axis square
%     xlabel('x')
% %     ylabel('y')
%     zlabel('z')
%     title(figureTitle);
    %legend('joints','x','y','z');
    hold off;
    fclose(fid);
end 