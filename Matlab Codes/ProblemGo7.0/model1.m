function y = model1(x)
    global Fsb Fgg...
            Length l Depth Vwind Vsea Lamda g Rousea... 
            Gsb Ggg Gfb Gball...
            Rfb Rsb Rgg Hfb;
    
    theta1 = x(1);
    theta2 = x(2);
    theta3 = x(3);
    theta4 = x(4);
    theta5 = x(5);
    h = x(6);
    
    Ffb = Rousea * g * pi * Rfb ^ 2 * h;
    Fwind = 0.625 * 2 * Rfb * (Hfb - h) * Vwind ^ 2;
    Fy1 = (Ffb + 4 * Fgg + Fsb) - (Gfb + 4 * Ggg + Gsb + Gball);
    A = Fwind / (Lamda * g);
    
    fupper =  (Fy1 ^ 2 / (Lamda * g) ^ 2 + Fwind ^ 2 / (Lamda * g) ^ 2) ^ (1 / 2);
    flower = ((Length - Fy1 / (Lamda * g)) ^ 2 + Fwind ^ 2 / (Lamda * g) ^ 2) ^ (1 / 2);
    
    U1 = (l * sin(theta1) * (Fsb - Gsb)) / 2 - l * sin(theta1) * (Fy1 + Gball) + Fwind * l * cos(theta1) ...
        + 374 * Rsb * Vsea ^ 2 * l ^ 2 * cos(theta1) ^ 2 - 374 * Rsb * Vsea ^ 2 * l ^ 2 * sin(theta1) ^ 2 ...
        + 748 * Rfb * Vsea ^ 2 * h * l * cos(theta1) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta1) * cos(theta2) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta1) * cos(theta3) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta1) * cos(theta4) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta1) * cos(theta5);
    U2 = l * sin(theta2) * (Fsb - Gsb) - l * sin(theta2) * (Fy1 + Gball) + Fwind * l * cos(theta2) + (1 * l * sin(theta2) * (Fgg - Ggg)) / 2 ...
        + 374 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta2) ^ 2 - 374 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta2) ^ 2 ...
        + 748 * Rfb * Vsea ^ 2 * h * l * cos(theta2) ...
        - 748 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta2) * sin(theta1) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta2) * cos(theta3) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta2) * cos(theta4) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta2) * cos(theta5);
    U3 = l * sin(theta3) * (Fsb - Gsb) - l * sin(theta3) * (Fy1 + Gball) + Fwind * l * cos(theta3) + (3 * l * sin(theta3) * (Fgg - Ggg)) / 2 ...
        + 374 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta3) ^ 2 - 374 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta3) * sin(theta3)...
        + 748 * Rfb * Vsea ^ 2 * h * l * cos(theta3) ...
        - 748 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta3) * (sin(theta1) + sin(theta2)) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta3) * cos(theta4) ... 
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta3) * cos(theta5);
    U4 = l * sin(theta4) * (Fsb - Gsb) - l * sin(theta4) * (Fy1 + Gball) + Fwind * l * cos(theta4) + (5 * l * sin(theta4) * (Fgg - Ggg)) / 2 ...
        + 374 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta4) ^ 2 - 374 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta4) ^ 2 ...
        + 748 * Rfb * Vsea ^ 2 * h * l * cos(theta4) ...
        - 748 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta4) * (sin(theta1) + sin(theta2) + sin(theta3)) ...
        + 748 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta4) * cos(theta5);
    U5 = l * sin(theta5) * (Fsb - Gsb) - l * sin(theta5) * (Fy1 + Gball) + Fwind * l * cos(theta5) + (7 * l * sin(theta5) * (Fgg - Ggg)) / 2 ...
        + 374 * Rgg * Vsea ^ 2 * l ^ 2 * cos(theta5) ^ 2 - 374 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta5) ^ 2 ...
        + 748 * Rfb * Vsea ^ 2 * h * l * cos(theta5) ...
        - 748 * Rgg * Vsea ^ 2 * l ^ 2 * sin(theta5) * (sin(theta1) + sin(theta2) + sin(theta3) + sin(theta4));
  GEO = h + l * (cos(theta1) + cos(theta2) + cos(theta3) + cos(theta4) + cos(theta5)) + fupper - flower - Depth;
    
    y(1) = U1;
    y(2) = U2;
    y(3) = U3;
    y(4) = U4;
    y(5) = U5;
    y(6) = GEO;
end