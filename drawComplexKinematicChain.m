function [outputArg1,outputArg2] = drawComplexKinematicChain(Chain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    clf
    drawComplexVector(0,Chain(1))
    hold on
    position = Chain(1)
    for i = 2:length(Chain)
        drawComplexVector(position,position + Chain(i))
        position = position + Chain(i)
    end
end

