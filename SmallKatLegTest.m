LegLengths = [0; 102; 185; 0];
LegLengths2 = [0; 92; 75; 120];

M = 120;
H = -40;
Zoff = -215;
dof3 = 0;
dof4 = 0;

%delete('TorqueData2.csv')
% cHeader = {'Fx' 'Fy' 'Fz' 'TotalTorque3dof' 'TotalTorque4dof' 'dof3' 'dof4'}; %dummy header
% commaHeader = [cHeader;repmat({','},1,numel(cHeader))]; %insert commaas
% commaHeader = commaHeader(:)';
% textHeader = cell2mat(commaHeader); %cHeader in text with commas
% fid = fopen('TorqueDataZgreaterthanX.csv','w'); 
% fprintf(fid,'%s\n',textHeader)
% fclose(fid)

Fx = 0;
Fy = 0;
Fz = 0;
for Fx = 0:0.1:1  
for Fz = 0:0.25:4
t = 0;
TotalTorque3dof = 0;
TotalTorque4dof = 0;
while t<(2*M)
%WalkingGait(t,M,H,Zoff)
Angles1 = SmallKat4dofIK(WalkingGait(t,M,H,Zoff), LegLengths); 
Angles2 = SmallKat4dofIK(WalkingGait(t,M,H,Zoff), LegLengths2); 
Angles1 = [Angles1(1); Angles1(3); Angles1(5); Angles1(7)]; %Inverse
Angles2 = [Angles2(1); Angles2(2); Angles2(4); Angles2(6)]; %Regular

if (t <= M )
F = [Fx;Fy;Fz;0;0;0];
end
if (t > M && t <= 2*M)
F = [0;0;0;0;0;0];
end

Force = SmallKatFTK(Angles1, LegLengths, F)
%Pos1 = SmallKatFPK(Angles1, LegLengths);
%SmallKatLegPlot(Angles1, LegLengths, [0;0;0]); 
TotalTorque3dof = TotalTorque3dof + abs(Force(1)) + abs(Force(2)) + abs(Force(3)) + abs(Force(4))

Force2 = SmallKatFTK(Angles2, LegLengths2, F)
%Pos2 = SmallKatFPK(Angles2, LegLengths2);
SmallKatLegPlot(Angles2, LegLengths2, [0;0;0]);
TotalTorque4dof = TotalTorque4dof + abs(Force2(1)) + abs(Force2(2)) + abs(Force2(3)) + abs(Force2(4))
t=t+1;
end
if (TotalTorque4dof<TotalTorque3dof)
    dof4 = dof4+1;
end
if (TotalTorque3dof<TotalTorque4dof)
    dof3 = dof3+1;
end
% Data = [Fx,Fy,Fz,TotalTorque3dof,TotalTorque4dof,dof3,dof4];
% dlmwrite('TorqueDataZgreaterthanX.csv',Data,'-append')
end
end 
