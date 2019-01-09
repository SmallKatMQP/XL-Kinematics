NumSegs = 3;
SegHeight = 15;
SegLength = 30;
TolLengthofCable1 = 30;
TolLengthofCable2 = 30;
TolLengthofCable3 = 30;
hypotenuse = sqrt(SegHeight^2 + SegLength^2)

CableLength1 = TolLengthofCable1/NumSegs;
CableLength2 = TolLengthofCable1/NumSegs;
CableLength3 = TolLengthofCable1/NumSegs;

B = acos(SegHeight/hypotenuse);
A = pi/2 - A;
A = rad2deg(A)

TC1 = acos((SegLength^2 + CableLength1^2 - hypotenuse^2)/(2*SegLength*CableLength1));
TA1 = acos((CableLength1^2 + hypotenuse^2 - SegLength^2)/(2*CableLength1*hypotenuse));
TB1 = pi - TA1 - TC1
angle1 = pi/2 - (B + TB1)

TC2 = acos((SegLength^2 + CableLength2^2 - hypotenuse^2)/(2*SegLength*CableLength2));
TA2 = acos((CableLength2^2 + hypotenuse^2 - SegLength^2)/(2*CableLength3*hypotenuse));
TB2 = pi - TA2 - TC2
angle2 = pi/2 - (B + TB2)

TC3 = acos((SegLength^2 + CableLength3^2 - hypotenuse^2)/(2*SegLength*CableLength3));
TA3 = acos((CableLength3^2 + hypotenuse^2 - SegLength^2)/(2*CableLength3*hypotenuse));
TB3 = pi - TA3 - TC3
angle3 = pi/2 - (B + TB3)

Z=0;
X=0;
for a = 1:1:NumSegs
    a
    Z = Z + SegHeight*cos(a*angle1)
    X = X + SegHeight*sin(a*angle1)
    
end


Z
X