function P = SmallKatLegPlot(Angles, LegLengths, JC)

%% 3D Graphing

q1 = (Angles(1));
q2 = (Angles(2));
q3 = (Angles(3));
q4 = (Angles(4));

%anglesdeg = [rad2deg(q1); rad2deg(q2); rad2deg(q3); rad2deg(q4)]

x = JC(1);
y = JC(2);
z = JC(3);

a1 = LegLengths(1);
a2 = LegLengths(2);
a3 = LegLengths(3);
a4 = LegLengths(4);
   
j1x = 0;
j1y = a1*sin(q1);
j1z = -a1*cos(q1);

j2x = a2*sin(q2);
j2y = sin(q1)*(a1 + a2*cos(q2));
j2z = -cos(q1)*(a1 + a2*cos(q2));

j3x = a3*sin(q2 + q3) + a2*sin(q2);
j3y = sin(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2));
j3z = -cos(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2));
 
j4x = a3*sin(q2 + q3) + a2*sin(q2) + a4*sin(q2 + q3 + q4);
j4y = sin(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2) + a4*cos(q2 + q3 + q4));
j4z = -cos(q1)*(a1 + a3*cos(q2 + q3) + a2*cos(q2) + a4*cos(q2 + q3 + q4));

%% Global Transform

j1G = [j1x; j1y; j1z; 1];
j2G = [j2x; j2y; j2z; 1];
j3G = [j3x; j3y; j3z; 1];
j4G = [j4x; j4y; j4z; 1];

jG = [j1G j2G j3G j4G];

PlotL1 = [[x j1G(1)], [y j1G(2)], [z j1G(3)],...
    [j1G(1) j2G(1)], [j1G(2) j2G(2)], [j1G(3) j2G(3)],...
    [j2G(1) j3G(1)], [j2G(2) j3G(2)], [j2G(3) j3G(3)],...
    [j3G(1) j4G(1)], [j3G(2) j4G(2)], [j3G(3) j4G(3)]];

clf
hold on
plot3([PlotL1(1) PlotL1(2)], [PlotL1(3) PlotL1(4)], [PlotL1(5) PlotL1(6)], [PlotL1(7) PlotL1(8)], [PlotL1(9) PlotL1(10)], [PlotL1(11) PlotL1(12)], [PlotL1(13) PlotL1(14)], [PlotL1(15) PlotL1(16)], [PlotL1(17) PlotL1(18)], [PlotL1(19) PlotL1(20)], [PlotL1(21) PlotL1(22)], [PlotL1(23) PlotL1(24)]); %,...
hold off
grid on;
axis([-200 200 -200 200])
axis equal
xlabel('x') % x-axis label
ylabel('y') % y-axis label
zlabel('z') % z-axis label
view([10, 100, 100])
drawnow
p = 1;
end
