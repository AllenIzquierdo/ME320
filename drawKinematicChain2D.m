function drawKinematicChain2D(Chain, Offset, LineSpec)
%drawKinematicChain2D
%   Draws two dimensional kinematic chain of any length. Usefull for
%       visualizing Kinematic Chain Behavior.
%   [Vx Vy; Wx Wy; Ux Uy;...] draw Vectors V,W,U,... head to tails
%   Offset: Move drawing origin by Offset (Vec2D)
    if nargin >= 2
        Chain = [Offset; Chain];
    end
    
    for i = 2:length(Chain)
        Chain(i,1) = Chain(i - 1, 1) +  Chain(i,1);
        Chain(i,2) = Chain(i - 1, 2) + Chain(i,2);
    end
    
    if nargin == 3
        plot(Chain(:,1),Chain(:,2), LineSpec);
    else
        plot(Chain(:,1),Chain(:,2));
    end
    axis equal
end

