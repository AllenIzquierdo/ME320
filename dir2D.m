function angle = dir2D(Vector2D)
% dir2D
%   Gets the angle of a 2d vector.
%   Input:
%       Vector2D: two dimensional vector
%   Output:
%       angle: angle of Vector2D in radians
    angle = atan2(Vector2D(2),Vector2D(1));
end

