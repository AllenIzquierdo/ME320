clf;
W1 = [-.7432,0.4727];
V1 = [0.5825,0.1724];
U1 = [-0.1804,-.4696];
G1 = [0.0197,1.1147];
L1 = [.5671,1.2383];
L1_ = [1,.25];
V1_ = [0.0552,-2.3906];
U1_ = [-.2086,-.2401];
G1_ = [.086,-1.5542];
beta = -20*d2r;
[alpha,gamma,alpha_,gamma_] = stephenson3Disp_InitConfig_Crank(W1,V1,U1,G1,L1,V1_,U1_,G1_,beta);
Chain = [rotVec2D(W1,beta);...
    rotVec2D(L1,alpha);...
    rotVec2D(V1_,alpha_);...
    -rotVec2D(U1_,gamma_)];
drawKinematicChain2D(Chain, [0,0])