% 3 precision position synthesis (Gripper)
clear all
close all
d2r=pi/180;
r2d=180/pi;
% precision positions
p1=[0 0]';
p2=[0.1815 0.4882]';
p3=[0.6647 1.4078]';
p21=p2-p1;
p31=p3-p1;
% rotation angles corresponding to p2 and p3
alpha2=-30*d2r;
alpha3=-75*d2r;
% Left dyad rotation corresponding to p2 and p3
beta2=15*d2r;
beta3=40*d2r;
% Right dyad rotation corresponding to p2 and p3
gama2=-20*d2r;
gama3=-35*d2r;
% precalculation
s_alpha2=sin(alpha2);s_alpha3=sin(alpha3);
c_alpha2=cos(alpha2);c_alpha3=cos(alpha3);
s_beta2=sin(beta2);s_beta3=sin(beta3);
c_beta2=cos(beta2);c_beta3=cos(beta3);
s_gama2=sin(gama2);c_gama2=cos(gama2);
s_gama3=sin(gama3);c_gama3=cos(gama3);
%
WZ=inv([c_beta2-1, -s_beta2, c_alpha2-1, -s_alpha2;...
    s_beta2, c_beta2-1, s_alpha2, c_alpha2-1;...
    c_beta3-1, -s_beta3, c_alpha3-1, -s_alpha3;...
    s_beta3, c_beta3-1, s_alpha3, c_alpha3-1])*[p21;p31];
%
US=inv([c_gama2-1, -s_gama2, c_alpha2-1, -s_alpha2;...
    s_gama2, c_gama2-1, s_alpha2, c_alpha2-1;...
    c_gama3-1, -s_gama3, c_alpha3-1, -s_alpha3;...
    s_gama3, c_gama3-1, s_alpha3, c_alpha3-1])*[p21;p31];  
%
alpha2s=15*d2r;
alpha3s=5*d2r;
gama2s=20*d2r;
gama3s=50*d2r;
s_alpha2s=sin(alpha2s);s_alpha3s=sin(alpha3s);
c_alpha2s=cos(alpha2s);c_alpha3s=cos(alpha3s);
s_gama2s=sin(gama2s);s_gama3s=sin(gama3s);
c_gama2s=cos(gama2s);c_gama3s=cos(gama3s);
%
UsVs=inv([c_gama2s-1, -s_gama2s, c_alpha2s-1, -s_alpha2s;...
    s_gama2s, c_gama2s-1, s_alpha2s, c_alpha2s-1;...
    c_gama3s-1, -s_gama3s, c_alpha3s-1, -s_alpha3s;...
    s_gama3s, c_gama3s-1, s_alpha3s, c_alpha3s-1])*[p21;p31];  
% Plot P1-Z1-W1 and P1-S1-U1 (P0)
Z1=[WZ(3),WZ(4)];Z=sqrt(Z1*Z1');% Z1 is a vector and Z is its magnitude
W1=[WZ(1),WZ(2)];W=sqrt(W1*W1');
S1=[US(3),US(4)];S=sqrt(S1*S1');
U1=[US(1),US(2)];U=sqrt(U1*U1');
U1s=[UsVs(1),UsVs(2)];Us=sqrt(U1s*U1s');
V1s=[UsVs(3),UsVs(4)];Vs=sqrt(V1s*V1s');
dyadLx=[0,-Z1(1),-Z1(1)-W1(1)];dyadLy=[0,-Z1(2),-Z1(2)-W1(2)];
dyadRx=[0,-S1(1),-S1(1)-U1(1)];dyadRy=[0,-S1(2),-S1(2)-U1(2)];
dyadRRx=[0,-V1s(1),-V1s(1)-U1s(1)];dyadRRy=[0,-V1s(2),-V1s(2)-U1s(2)];
plot(dyadLx,dyadLy,'-bo');
hold on
plot(dyadRx,dyadRy,'-bo');
plot(dyadRRx,dyadRRy,'-bo');
axis equal
plot([p1(1),p2(1),p3(1)],[p1(2),p2(2),p3(2)],'r*');
% Four bar simulation from a dimensional anaysis, W1, Z1, S1, U1
%
theta=atan2(W1(2),W1(1));
sigma=atan2(U1(2),U1(1));
G1=Z1+W1-U1-S1;
V1=Z1-S1;
rho=atan2(V1(2),V1(1));
sigmas=atan2(U1s(2),U1s(1));
phi=atan2(Z1(2),Z1(1));
% location of left ground pin
a0=-W1-Z1;
% location of right ground pin
b0=-S1-U1;
% location of right ground pin
c0=-V1s-U1s;
%
a1=-Z1;% tip of W1
b1=-S1;% tip of U1
c1=-V1s; % tip of V1s
P0=[0 0]; 
% precision position 2
a2=a0+W*[cos(theta+beta2) sin(theta+beta2)]; %a2=W*exp(i*(theta+beta2));
b2=b0+U*[cos(sigma+gama2) sin(sigma+gama2)]; %U*exp(i*(sigma+gama2));%
c2=c0+Us*[cos(sigmas+gama2s) sin(sigmas+gama2s)];
P2=a2+Z*[cos(phi+alpha2) sin(phi+alpha2)]; %P2=a2+Z*exp(i*(phi+alpha2))
plot([a0(1) a2(1) P2(1) b2(1) b0(1)],[a0(2) a2(2) P2(2) b2(2) b0(2)],'--ro');
hold on
plot([c0(1) c2(1) P2(1)],[c0(2) c2(2) P2(2)],'--ro');
% precision position 3
a3=a0+W*[cos(theta+beta3) sin(theta+beta3)]; %a2=W*exp(i*(theta+beta3));
b3=b0+U*[cos(sigma+gama3) sin(sigma+gama3)]; %U*exp(i*(sigma+gama3));%
c3=c0+Us*[cos(sigmas+gama3s) sin(sigmas+gama3s)];
P3=a3+Z*[cos(phi+alpha3) sin(phi+alpha3)]; %P2=a3+Z*exp(i*(phi+alpha3))
plot([a0(1) a3(1) P3(1) b3(1) b0(1)],[a0(2) a3(2) P3(2) b3(2) b0(2)],'-.kx');
plot([c0(1) c3(1) P3(1)],[c0(2) c3(2) P3(2)],'-.kx');
WZ
US
U1s
V1s
a0
b0
c0

