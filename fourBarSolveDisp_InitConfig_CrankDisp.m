% Perhaps consider using nested functions for all fsolve for readability
% Eq = 0 for nexted function
function [Alpha, Gamma] = fourBarSolveDisp_InitConfig_CrankDisp(W1, V1, U1, G1,...
    Beta)
    
    % Initial Angles Using Initial Configuration W1 V1 U1
    theta = dir2D(W1);
    rho  = dir2D(V1);
    sigma = dir2D(U1);
    W = norm(W1);
    V = norm(V1);
    U = norm(U1);
    
    
    function [f1, f2] = simulatenousEq(AlphaGamma)
        alpha = AlphaGamma(1);
        f1 = W*cos(theta + Beta) + V*cos(rho + alpha) + U*cos(sigma + gamma) - G1(1);
        f2 = W*sin(theta + Beta) + V*sin(rho + alpha) + U*sin(sigma + gamma) - G1(2);
    end
    [Alpha, Gamma] = 
    
end

