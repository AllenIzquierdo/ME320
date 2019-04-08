function drawPolygonToWorld2D(originPosition, originAngle, polygonX, polygonY, varargin)
       %drawPolygonToWorld2D
       % TODO, make matrix drawing library versions
       
        for i=1:length(polygonX)
            vector = [polygonX(i),polygonY(i)];
            vector = rotVec2D(vector,originAngle);
            polygonX(i) = vector(1) + originPosition(1);
            polygonY(i) = vector(2) + originPosition(2);
        end
        plot(polyshape(polygonX,polygonY),'FaceColor','red','FaceAlpha',0.1);
end

