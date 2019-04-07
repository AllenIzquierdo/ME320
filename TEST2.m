W1 = Vec2D(1.75,90*d2r);
V1 = Vec2D(1.75,-22.4860*d2r);
U1 = Vec2D(1.75,64.5895*d2r);
G1 = [0.866,-0.5];
L1 = Vec2D(1,6.4690*d2r);
V1_ = Vec2D(1.75,-8.8397*d2r);
U1_ = Vec2D(1.75,65.6031*d2r);
G1_ = [1.1340,0.5];
[Alpha, Beta, Alpha_, Gamma_] = stephenson3Disp_InitConfig_Crank(W1,V1,U1,G1,...
L1,V1_,U1_,G1_,50*d2r)