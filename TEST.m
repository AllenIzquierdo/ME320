W1 = Vec2D(1.96,47.4041*d2r);
V1 = Vec2D(0.33,-51.6935*d2r);
U1 = Vec2D(2.09,63.7721*d2r);
G1 = [0.6075,-.6909];
W = norm(W1);
V = norm(V1);
U = norm(U1);
G = norm(G1);
theta = dir2D(W1);
rho = dir2D(V1);
sigma = dir2D(U1);
beta = 0;

[alpha, gamma] = fourBarSolveDisp_InitConfig_CrankDisp(W1,V1,U1,G1,beta)

for i = 1:length(beta)
    L1 = Vec2D(W,theta + beta(i));
    L2 = Vec2D(V,rho + alpha(i));
    L3 = -Vec2D(U,sigma + gamma(i));
    L4 = -G1;
    drawKinematicChain2D([L1;L2;L3;L4],[0,0]);
    hold on;
end

