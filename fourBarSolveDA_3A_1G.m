function [W1 V1 U1] = fourBarSolveDA_3A_1G(Ground,a2,a3,b2,b3,g2,g3)
% fourBarSolveDA_3A_1G
%   Solves four bar linkage lengths using a constant ground link.
%   Ground: Input length of ground link, assumed to be in positive
%       x direction.
%   W1 V1 U1: W1 V1 and U1 are the three links, with V1 being the
%       coupler (Vec2D).
%   Use pg153 of "Kinematics and Dyanimcis of Mechanical Systems
%   2ed"(Russel) for reference

% Matrix Coeffecient eq 5.24
A = [1 0 1 0 -1 0;...
    0 1 0 1 0 -1;...
    cos(b2) -sin(b2) cos(a2) -sin(a2) -cos(g2) sin(g2);...
    sin(b2) cos(b2) sin(a2) cos(a2) -sin(g2) -cos(g2);...
    cos(b3) -sin(b3) cos(a3) -sin(a3) -cos(g3) sin(g3);...
    sin(b3) cos(b3) sin(a3) cos(a3) -sin(g3) -cos(g3)];

% From Speical Case (Ground Link in Positive X axis
b = [1 0 1 0 1 0]';

% Solve for Initial Link Vectors eq 5.24
x = A\b;
W1 = [x(1),x(2)];
V1 = [x(3),x(4)];
U1 = [x(5),x(6)];
end

