function symVec3D(str, createComponentsFlag)
%symVec3D
%R =
%
%[ R1_x, R1_y, R1_z]
    for i = 1:length(str)
        symbolicVector(1) = sym(strcat(str(i),{'_x'}));
        symbolicVector(2) = sym(strcat(str(i),{'_y'}));
        symbolicVector(3) = sym(strcat(str(i),{'_z'}));
        assignin('caller',str(i),symbolicVector);
        if createComponentsFlag
            assignin('caller',strcat(str(i),{'_x'}),symbolicVector(1));
            assignin('caller',strcat(str(i),{'_y'}),symbolicVector(2));
            assignin('caller',strcat(str(i),{'_z'}),symbolicVector(3));
        end
    end
end
