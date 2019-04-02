function Vec = Vec2D(magnitude, direction)
%Vec2D
%   Creates two dimensional vector object
%   Magnitude: magnitude of vector
%   direction: angle direction with respect to positive x axis (radians)
    Vec = [magnitude*cos(direction), magnitude*sin(direction)];
end

