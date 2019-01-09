function pos = WalkingGait(t,M,H,Zoff)
if t <= M
x = M/2 - t;
y = 0;
z = Zoff;
inc = 45/M;
A = deg2rad(45+(t*inc));
pos = [x,y,z,A];
end

if (t > M && t <= 2*M)
x = -M/2 + (t-M);
A = H/((0+(-M/2))*(0+(M/2)));
y = 0;
z = Zoff - (A*((x+(-M/2))*(x+(M/2))));
inc = 45/M;
A = deg2rad(90-((t-M)*inc));
pos = [x,y,z,A];
end