function Tip = LegFPK(Angles, LegLengths)

%% Forward Kinematics

%DH Table for leg

% _______________________________________
% | Link |  a   | alpha |   d   | theta |
% |   1  |  0   | q1+90 |   0   |   0   |
% |   2  |  a1  |   0   |   0   |   q2  |
% |   3  |  a2  |   0   |   0   |   q3  |
% |   4  |  a3  |   0   |   0   |   q4  |
% _______________________________________

% %Test Values
% q1 = deg2rad(0);
% q2 = deg2rad(15);
% q3 = deg2rad(-45);
% q4 = deg2rad(90); 
% a1 = 0;
% a2 = 92;
% a3 = 75;
% a4 = 120;

q1 = (Angles(1));
q2 = (Angles(2));
q3 = (Angles(3));
q4 = (Angles(4));

a1 = LegLengths(1);
a2 = LegLengths(2);
a3 = LegLengths(3);
a4 = LegLengths(4);


x = a3*sin(q2 + q3) + a2*sin(q2) + a4*sin(q2 + q3 + q4); 
y = sin(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2) + a4*cos(q2 + q3 + q4));
z = -cos(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2) + a4*cos(q2 + q3 + q4));
Tip = [x,y,z];
end