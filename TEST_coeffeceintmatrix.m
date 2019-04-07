
clear,clc;
vectors = ["Fa1","Fb1","Fp1","Fg1","g",...
    "V1","L1","R2"];
symVec3D(vectors,false);
syms m2;
 -Fa1-Fb1+Fp1-m2*g==0