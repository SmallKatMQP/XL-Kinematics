function FTK = LegFTK(Angles, Leg, F)

%Forward Torque Kinematics
%Angles = [0,15,-15,15];
%Leg = [0,92,75,120];
q1 = (Angles(1));
q2 = (Angles(2));
q3 = (Angles(3));
q4 = (Angles(4));

a1 = Leg(1)*.1;
a2 = Leg(2)*.1;
a3 = Leg(3)*.1;
a4 = Leg(4)*.1;

%T = [0;.75;2;0;0;0];

%Tranpose of Jacobian Solved in SmallKat Forward Kinematics  
J = [                                                                  0,            a3*cos(q2 + q3) + a2*cos(q2) + a4*cos(q2 + q3 + q4),            a3*cos(q2 + q3) + a4*cos(q2 + q3 + q4),          a4*cos(q2 + q3 + q4);...
 cos(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2) + a4*cos(q2 + q3 + q4)), -sin(q1)*(a3*sin(q2 + q3) + a2*sin(q2) + a4*sin(q2 + q3 + q4)), -sin(q1)*(a3*sin(q2 + q3) + a4*sin(q2 + q3 + q4)), -a4*sin(q2 + q3 + q4)*sin(q1);...
 sin(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2) + a4*cos(q2 + q3 + q4)),  cos(q1)*(a3*sin(q2 + q3) + a2*sin(q2) + a4*sin(q2 + q3 + q4)),  cos(q1)*(a3*sin(q2 + q3) + a4*sin(q2 + q3 + q4)),  a4*sin(q2 + q3 + q4)*cos(q1);...
                                                                 1,                                                              0,                                                 0,                             0;...
                                                                  0,                                                              1,                                                 1,                             1;...
                                                                  0,                                                              0,                                                 0,                             0];
 
Jt = transpose(J);
FTK = (Jt*F);
end