%Quadruped Leg Kinematics

%% Body Kinematics

syms a1 a2 a3 a4 a5 A1 A2 d1 q1 q2 q3 q4 q5 w1 w2 w3 Bx By Bz t1 t2 t3

BTrans = [1 0 0 Bx;...
     0 1 0 By;...
     0 0 1 Bz;...
     0 0 0 1];

Brotz = [cos(t1) -sin(t1) 0 0;...
       sin(t1) cos(t1) 0 0;...
       0 0 1 0
       0 0 0 1];
   
Broty = [cos(t2) 0 sin(t2) 0;...
       0 1 0 0;...
       -sin(t2) 0 cos(t2) 0;
       0 0 0 1];
   
Brotx = [1 0 0 0;...
       0 cos(t3) -sin(t3) 0;...
       0 sin(t3) cos(t3) 0;...
       0 0 0 1];
   
A = BTrans*Brotz*Broty*Brotx

%% Forward Kinematics

%DH Table for leg

% _______________________________________
% | Link |  a   | alpha |   d   | theta |
% |   1  |  0   | q1+90 |   0   |   0   |
% |   2  |  a1  |   0   |   0   |   q2  |
% |   3  |  a2  |   0   |   0   |   q3  |
% |   4  |  a3  |   0   |   0   |   q4  |
% _______________________________________

%Create DH Transformations

rotz = [cos(A2) -sin(A2) 0 0;...
       sin(A2) cos(A2) 0 0;...
       0 0 1 0
       0 0 0 1];
   
rotx = [1 0 0 0
       0 cos(A2) -sin(A2) 0;...
       0 sin(A2) cos(A2) 0;...
       0 0 0 1];
   
B = rotz*rotx;
V = [0 2 -11 0];
test = V*B

TB0 = simplify(MatrixTransform(0, A1,0,q1-deg2rad(90)));
T01 = simplify(MatrixTransform(a1,0,0,0));
T12 = simplify(MatrixTransform(a2,0,0,-q2));
T23 = simplify(MatrixTransform(a3,0,0,-q3)); 
T34 = simplify(MatrixTransform(a4,0,0,-q4));
%T4T = simplify(MatrixTransform(a5,0,0,q5));

%Forward Position Kinematics
T04 = simplify(B*TB0*T01);
x = simplify(T04(1,4))
y = simplify(T04(2,4))
z = simplify(T04(3,4))

T04 = simplify(B*TB0*T01*T12);
x = simplify(T04(1,4))
y = simplify(T04(2,4))
z = simplify(T04(3,4))

T04 = simplify(B*TB0*T01*T12*T23);
x = simplify(T04(1,4))
y = simplify(T04(2,4))
z = simplify(T04(3,4))

T04 = simplify(B*TB0*T01*T12*T23*T34);
x = simplify(T04(1,4))
y = simplify(T04(2,4))
z = simplify(T04(3,4))

var = [A1, A2];
val  = [deg2rad(-90), deg2rad(90)];
test = simplify(subs(test,var, val))
x = simplify(subs(x,var, val))
y = simplify(subs(y,var, val))
z = simplify(subs(z,var, val))
w1 = q1 
w2 = q2+q3+q4+q5
w3 = 0

%% Force Propagation 

J = jacobian([x, y, z, w1, w2, w3], [q1, q2, q3, q4])
Jt = transpose(J)
% Transpose(J)*F = torques on joints