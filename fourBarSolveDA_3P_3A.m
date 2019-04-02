function [W1, Z1, U1, S1] = fourBarSolveDA_3P_3A(P1, P2, P3, a2, a3, b2, b3, g2, g3)
%fourBarSolveDA_3P_3A
%   Quantitatively solves 4 bars using prescribed three precision points 
%   and three displacement angles. Refer to pg137 of "Kinematics and 
%   Dynamics of Mechanical systems 2nd ed"(Russel) for context.
%   P1,P2,P3[x,y]: Precision Points
%   a2, a3: Coupler Angular Displacment of coupler polygon
%   b2, b3: Angular Displacment of W Linkage
%   g2, g3: Angular Displacment of U Linkage
%   Z and S linkage defines coupler polygon

% left dyad coeffecient matrix eq 5.8
A1 = [cos(b2) - 1, -sin(b2), cos(a2) - 1, -sin(a2);...
    sin(b2), cos(b2)-1, sin(a2), cos(a2) - 1;...
    cos(b3) - 1, -sin(b3), cos(a3)-1, -sin(a3);...
    sin(b3), cos(b3) - 1, sin(a3), cos(a3) - 1];

% right dyad coeffecient matrix eq 5.9
A2 = [cos(g2) - 1, -sin(g2), cos(a2) - 1, -sin(a2);...
    sin(g2), cos(g2) - 1, sin(a2), cos(a2) - 1;...
    cos(g3) - 1, -sin(g3), cos(a3) - 1, -sin(a3);...
    sin(g3), cos(g3) - 1, sin(a3), cos(a3) - 1];

% Use precision point vectors to describe coupler displacment (eq5.8 & 5.9)
P21 = P2 - P1;
P31 = P3 - P1;
b = [P21(1), P21(2), P31(1), P31(2)]'; %P21(1) = x comp, P21(2) = y comp

% solve and construct outputs Ax = b.
x1 = A1\b; % eq 5.8
x2 = A2\b; % eq 5.9
W1 = [x1(1), x1(2)];
Z1 = [x1(3), x1(4)];
U1 = [x2(1), x2(2)];
S1 = [x2(3), x2(4)];
end

