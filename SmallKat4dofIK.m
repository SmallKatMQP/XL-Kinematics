function pos = IK2(Pos, Leg)

x = Pos(1);
y = Pos(2);
z = Pos(3);
Oang = Pos(4);

L1 = Leg(1);
L2 = Leg(2);
L3 = Leg(3);
L4 = Leg(4);

% x = 90;
% y = 50;
% z = -210;
% 
% Oang = deg2rad(45);
% L1 = 0;
% L2 = 92;
% L3 = 75;
% L4 = 120;

theta1 = atan(y/abs(z));

r1 = sqrt(z^2 + y^2);
x1 = r1;
y1 = x;
Px = x1-L4*sin(Oang);
Py = y1-L4*cos(Oang);

theta31 = -acos(((Px^2 + Py^2)-(L2^2 + L3^2))/(2*L2*L3));
theta32 = acos(((Px^2 + Py^2)-(L2^2 + L3^2))/(2*L2*L3));

B = atan(Py/Px);
Y = acos((Px^2 + Py^2 + L2^2 - L3^2)/(2*L2*sqrt(Px^2+Py^2)));

theta21 = B+Y;%2 Solutions
theta22 = B-Y;

theta41 = (pi/2-Oang) - (theta21+theta31);
theta42 = (pi/2-Oang) - (theta22+theta32);

pos = [theta1 theta21 theta22 theta31 theta32 theta41 theta42];

theta21 = rad2deg(theta21);
theta22 = rad2deg(theta22);
theta31 = rad2deg(theta31);
theta32 = rad2deg(theta32);
theta41 = rad2deg(theta41);
theta41 = rad2deg(theta42);



end
