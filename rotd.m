function [R] = rotd(theta,dir)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
R = rot(theta*pi/180, dir);
end

