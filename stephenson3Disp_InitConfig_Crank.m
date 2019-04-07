%pg101
function [alpha, gamma, Alpha_, Gamma_] = stephenson3Disp_InitConfig_Crank(W1,V1,U1,G1,L1,V1_,U1_,G1_,Beta)
    theta = dir2D(W1);
    rho_ = dir2D(V1_);
    sigma_ = dir2D(U1_);
    L_init_dir = dir2D(L1);
    W = norm(W1);
    L = norm(L1);
    V_ = norm(V1_);
    U_ = norm(U1_);
    
    [alpha, gamma] = fourBarSolveDisp_InitConfig_CrankDisp(W1,V1,U1,G1,Beta);
    
    function f1f2 = simulatenousEq(AlphaGamma_)
            alpha_ = AlphaGamma_(1);
            gamma_ = AlphaGamma_(2);
            f1f2(1) = W*cos(theta + beta) + L*cos(L_init_dir + alpha) + V_*cos(rho_ + alpha_) - U_*cos(sigma_ + gamma_) - G1_(1) - G1(1);
            f1f2(2) = W*sin(theta + beta) + L*sin(L_init_dir + alpha) + V_*sin(rho_ + alpha_) - U_*sin(sigma_ + gamma_) - G1_(2) - G1(2);
    end
    for i = 1:length(Beta)
        beta = Beta(i);
        [AlphaGamma_] = fsolve(@simulatenousEq,[0 0]);
        Alpha_(i) = AlphaGamma_(1);
        Gamma_(i) = AlphaGamma_(2);
    end
end

