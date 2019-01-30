function P = SmallKatBodyPlot(L1, L2, L3, L4, Body)
PlotL1 = L1
PlotL2 = L2;
PlotL3 = L3;
PlotL4 = L4;
PlotL1(1)
PlotL1(2)
PlotL1(3)
clf
hold on
plot3([0 Body(1)], [0 Body(2)], [0 Body(3)], [0 Body(5)], [0 Body(6)], [0 Body(7)], [0 Body(9)], [0 Body(10)], [0 Body(11)], [0 Body(13)], [0 Body(14)], [0 Body(15)],...
      [PlotL1(1) PlotL1(2)], [PlotL1(3) PlotL1(4)], [PlotL1(5) PlotL1(6)], [PlotL1(7) PlotL1(8)], [PlotL1(9) PlotL1(10)], [PlotL1(11) PlotL1(12)], [PlotL1(13) PlotL1(14)], [PlotL1(15) PlotL1(16)], [PlotL1(17) PlotL1(18)], [PlotL1(19) PlotL1(20)], [PlotL1(21) PlotL1(22)], [PlotL1(23) PlotL1(24)],... 
      [PlotL2(1) PlotL2(2)], [PlotL2(3) PlotL2(4)], [PlotL2(5) PlotL2(6)], [PlotL2(7) PlotL2(8)], [PlotL2(9) PlotL2(10)], [PlotL2(11) PlotL2(12)], [PlotL2(13) PlotL2(14)], [PlotL2(15) PlotL2(16)], [PlotL2(17) PlotL2(18)], [PlotL2(19) PlotL2(20)], [PlotL2(21) PlotL2(22)], [PlotL2(23) PlotL2(24)],... 
      [PlotL3(1) PlotL3(2)], [PlotL3(3) PlotL3(4)], [PlotL3(5) PlotL3(6)], [PlotL3(7) PlotL3(8)], [PlotL3(9) PlotL3(10)], [PlotL3(11) PlotL3(12)], [PlotL3(13) PlotL3(14)], [PlotL3(15) PlotL3(16)], [PlotL3(17) PlotL3(18)], [PlotL3(19) PlotL3(20)], [PlotL3(21) PlotL3(22)], [PlotL3(23) PlotL3(24)],...
      [PlotL4(1) PlotL4(2)], [PlotL4(3) PlotL4(4)], [PlotL4(5) PlotL4(6)], [PlotL4(7) PlotL4(8)], [PlotL4(9) PlotL4(10)], [PlotL4(11) PlotL4(12)], [PlotL4(13) PlotL4(14)], [PlotL4(15) PlotL4(16)], [PlotL4(17) PlotL4(18)], [PlotL4(19) PlotL4(20)], [PlotL4(21) PlotL4(22)], [PlotL4(23) PlotL4(24)]); 
    
 
hold off
grid on;
axis([-200 200 -200 200])
axis equal
xlabel('x') % x-axis label
ylabel('y') % y-axis label
zlabel('z') % z-axis label
view([10, 100, 100])
drawnow
P = 1;
end