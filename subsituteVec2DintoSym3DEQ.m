function eq = subsituteVec2DintoSym3DEQ(eq, vec2D, sym3D)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    xyz = [vec2D(1), vec2D(2), 0];
    eq = subs(eq,[sym3D(1),sym3D(2),sym3D(3)],xyz);
end

