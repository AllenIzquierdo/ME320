function drawComplexVector(initpos, finalpos)
    initx = real(initpos);
    inity = imag(initpos);
    finalx = real(finalpos);
    finaly = imag(finalpos);
    drawVector([initx,inity,0], [finalx, finaly,0]);
end

