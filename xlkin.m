syms t1 t2 t3 t4 l2 l3 l4 a2 a3 a4

dh = [
    0, 0, t1, pi;
    0, l2, t2, a2;
    0, l3, t3, a3;
    0, l4, t4, a4];
T = eye(4);
for i = 1:size(dh, 2)
    T = T * tdh(dh(i, :));
end

disp(T(:, 4))

% d r alpha theta
function result = tdh(dhparam)
    d = dhparam(1);
    r = dhparam(2);
    alpha = dhparam(3);
    theta = dhparam(4);
    
    result = [
        cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), r*cos(theta);
        sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), r*sin(theta);
                 0,             sin(alpha),             cos(alpha),            d;
             	 0,                      0,                      0,            1];
        
end