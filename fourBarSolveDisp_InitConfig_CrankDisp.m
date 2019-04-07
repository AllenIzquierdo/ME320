% Perhaps consider using nested functions for all fsolve for readability
% Eq = 0 for nested functions, see pg67 for linkdage definations
% Note, fsolve is one argument input output in form f(x[]) = [0,0,0,0,...]
function [Alpha, Gamma] = fourBarSolveDisp_InitConfig_CrankDisp(W1, V1, U1, G1, Beta)
    
    % Initial Angles Using Initial Configuration W1 V1 U1
    theta = dir2D(W1);
    rho  = dir2D(V1);
    sigma = dir2D(U1);
    W = norm(W1);
    V = norm(V1);
    U = norm(U1);
    function f1f2 = simulatenousEq(AlphaGamma)
            alpha = AlphaGamma(1);
            gamma = AlphaGamma(2);
            f1f2(1) = W*cos(theta + beta) + V*cos(rho + alpha) - U*cos(sigma + gamma) - G1(1);
            f1f2(2) = W*sin(theta + beta) + V*sin(rho + alpha) - U*sin(sigma + gamma) - G1(2);
    end
    for i = 1:length(Beta)
        beta = Beta(i);
        [AlphaGamma] = fsolve(@simulatenousEq,[0 0]);
        Alpha(i) = AlphaGamma(1);
        Gamma(i) = AlphaGamma(2);
    end
    
end

