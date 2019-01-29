syms l1 l2 d2 l3 d3 l4 theta1 theta2 theta3 theta4

%        d       r      alpha    theta  
dh = [
    0, 0, theta1, pi/2;
    0, l2, theta2, 0;
    0, l3, theta3, 0;
    0, l4, theta4, pi]
 
result = dhCalc(dh(1, :)) * dhCalc(dh(2, :)) * dhCalc(dh(3, :)) * dhCalc(dh(4, :));

x = result(1, 4)
y = result(2, 4)
z = result(3, 4)
theta4



ikin = 

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
    

 