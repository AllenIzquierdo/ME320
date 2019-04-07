function rotatedVector = rotVec2D(vec2d, radians)
    V = norm(vec2d);
    Vdir = dir2D(vec2d);
    rotatedVector = Vec2D(V, Vdir + radians);
end

