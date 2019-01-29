syms theta1 theta2 theta3 theta4 l2 l3 l4

%% Kinematics Calculator
dh = [
    0, 0, theta1, pi/2;
    0, l2, theta2, 0;
    0, l3, theta3, 0;
    0, l4, theta4, pi]
 
fwkin = dhCalc(dh(1, :)) * dhCalc(dh(2, :)) * dhCalc(dh(3, :)) * dhCalc(dh(4, :));

eq1  = x == simplify(fwkin(1, 4))
eq2 = y == simplify(fwkin(2, 4))
eq3 = z == simplify(fwkin(3, 4))
eq4 = ang == pi/2 - theta4 - theta3 - theta2

%% Ikin
ikin = solve([eq1, eq2, eq3, eq4], [theta1, theta2, theta3, theta4])















%% Transformations
function T = transZ(z)
    T = [   1, 0, 0, 0;
            0, 1, 0, 0;
            0, 0, 1, z;
            0, 0, 0, 1]; 
end
function T = transY(y)
    T = [   1, 0, 0, 0;
            0, 1, 0, y;
            0, 0, 1, 0;
            0, 0, 0, 1]; 
end

function T = transX(x)
    T = [   1, 0, 0, x;
            0, 1, 0, 0;
            0, 0, 1, 0;
            0, 0, 0, 1]; 
end


function T = rotZ(theta)
    % Assumes theta is in RAD not DEG
    T = [   cos(theta), -sin(theta), 0, 0;
            sin(theta),  cos(theta), 0, 0;
                     0,           0, 1, 0;
                     0,           0, 0, 1]; 
end

function T = rotY(theta)
    % Assumes theta is in RAD not DEG
    T = [   cos(theta), 0, sin(theta), 0;
                     0, 1,          0, 0;
           -sin(theta), 0, cos(theta), 0;
                     0, 0,          0, 1];
end

function T = rotX(theta)
    % Assumes theta is in RAD not DEG
    T = [  1,          0,           0, 0;
           0, cos(theta), -sin(theta), 0;
           0, sin(theta),  cos(theta), 0;
           0,          0,           0, 1];
end


%% DH Calculator
    function result = dhCalc(dhrow)
        d = dhrow(1);
        r = dhrow(2);
        a = dhrow(4);
        t = dhrow(3);
    
        result = [
            cos(t), -sin(t)*cos(a),  sin(t)*sin(a), r*cos(t);
            sin(t),  cos(t)*cos(a), -cos(t)*sin(a), r*sin(t);
                 0,         sin(a),         cos(a),        d;
                 0,              0,              0,        1];
        
    end