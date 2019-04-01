function [R] = rot(theta, dir)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    v = 1 - cos(theta);
    x = dir(1);
    y = dir(2);
    z = dir(3);
    R = zeros(3);
    R(1,1) = x^2*v + cos(theta);
    R(2,1) = x*y*v + z*sin(theta);
    R(3,1) = x*z*v - y*sin(theta);
    R(1,2) = x*y*v - z*sin(theta);
    R(2,2) = y^2*v + cos(theta);
    R(3,2) = y*z*v + x*sin(theta);
    R(1,3) = x*z*v + y*sin(theta);
    R(2,3) = y*z*v - x*sin(theta);
    R(3,3) = z^2*v + cos(theta);
end
