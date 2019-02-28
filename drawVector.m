function [outputArg1,outputArg2] = drawVector(initpos, finalpos)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
quiver3(initpos(1), initpos(2), initpos(3),...
    finalpos(1) - initpos(1), finalpos(2) - initpos(2),...
    finalpos(3) - initpos(3));
end

