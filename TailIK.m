%% Input parameters
Base = [0; 0; 0];
B=0;
Y = 0; %the rotation angle of the bending plane.

B2 = 0;
Y2 = 0; %the rotation angle of the bending plane.

%% Stage 1 variables
r = 2 %the distance from the primary backbone to each secondary backbone on the disk.
n = 3; %the number of secondary backbones.
theta = (2*pi)/n; %division angle (? = 2? / n) 
h = 15; %distance between adjacent disks.
l = 15.70796; %length of the flexible beam
numlength = 10;
x = 10; %numbered length segment
s = (x/numlength)*l; %arc-length parameter of the segment OP (s=0 at the base disk and s=l at the end disk)
%ro %curvature radius of the primary backbone, defined in the bending plane.
Bp = (s*B)/l;%the bending angle of the primary backbone tangent in the X1Z1 plane at the point P. ? is the bending angle at the end disk.

%% Stage 2 variables
r2 = 2 %the distance from the primary backbone to each secondary backbone on the disk.
n2 = 3; %the number of secondary backbones.
theta2 = (2*pi)/n; %division angle (? = 2? / n) 
h2 = 15; %distance between adjacent disks.
l2 = 15.70796; %length of the flexible beam
numlength2 = 10;
x2 = 10; %numbered length segment
s2 = (x/numlength)*l; %arc-length parameter of the segment OP (s=0 at the base disk and s=l at the end disk)
%ro %curvature radius of the primary backbone, defined in the bending plane.
Bp2 = (s*B2)/l;%the bending angle of the primary backbone tangent in the X1Z1 plane at the point P. ? is the bending angle at the end disk.

%% Stage 1 Math
if (B == 0)
    P = [0;0;s]
else
% X1 = (s/Bp)*(1-cos(Bp));
% Y1 = 0;
% Z1 = (s/Bp)*(sin(Bp));
P = [(s/Bp)*(1-cos(Bp))*cos(Y); (s/Bp)*(1-cos(Bp))*sin(Y); (s/Bp)*sin(Bp)]
end
q1=r*B*cos(Y)
q2=r*B*cos(-Y+theta)
q3=r*B*cos(Y+theta)

%% Stage 2 Math
if (B2 == 0)
    P2 = [0;0;s]
else
% X2 = (s2/Bp2)*(1-cos(Bp2));
% Y2 = 0;
% Z2 = (s2/Bp2)*(sin(Bp2));
P2 = [(s2/Bp2)*(1-cos(Bp2))*cos(Y2); (s2/Bp2)*(1-cos(Bp2))*sin(Y2); (s2/Bp2)*sin(Bp2)]
end
q4=r2*B*cos(Y2)+r2*B2*cos(Y2);
q5=r2*B*cos(-Y2+theta)+r2*B2*cos(-Y2+theta2);
q6=r2*B*cos(Y+theta)+r2*B2*cos(Y+theta2);

%% Stage 1 and 2
rotz = [cos(Y) -sin(Y) 0;...
       sin(Y) cos(Y) 0;...
       0 0 1];
   
roty = [cos(B) 0 sin(B);...
       0 1 0;...
       -sin(B) 0 cos(B)];
   
% rotx = [1 0 0;...
%        0 cos(0) -sin(0);...
%        0 sin(0) cos(0)];
 
A = rotz*roty;
P2 = A*P2
%Ouput  
q1;
q2;
q3;
q4;
q5;
q6;
Tailend = P+P2
% R = [(cos(Y)^2)*cos(B) + (sin(Y)^2), cos(Y)*sin(Y)*cos(B) - cos(Y)*sin(Y), cos(Y)*sin(B);...
%       cos(Y)*sin(Y)*cos(B)- cos(Y)*sin(Y), (sin(Y)^2)*cos(B) + cos(Y)^2, sin(Y)*sin(B);...
%       -cos(Y)*sin(B), -sin(Y)*sin(B), cos(B)]
% 
% E = P*R
