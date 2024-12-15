% 手指工作空间的点云图
clear
clc
%Directly click the Run button on the Matlab editor to get the workspace
%The human thumb has a complex structure, with variations in the distribution of its degrees of freedom across different anatomy textbooks. 
%For easy comparison, in this work, the range of motion of the human thumb joints has been expanded to match that of the prosthetic hand.
%The range of motion of the prostheitic hand thumb joints, comes from Supplementary Table 6
a0min=-25;a0max=38;
a1min=-27;a1max=45;a2min=-20;a2max=35;
a3min=-40;a3max=65;a4min=-10;a4max=80;

%Too many random trials will consume a significant amount of time and computer resources. 
%Moreover, due to diminishing returns, the improvement in simulation accuracy will be minimal. 
% We recommend conducting no more than 100,000 random trials, with 50,000 being ideal, to ensure quick results.
N=1000000;%选择N个随机点(Select N random experiments)
pointsize=30;
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min + (a3max - a3min).*rand(N,1);
a4 = a4min + (a4max - a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
% 从上往下，CMC转动，左右摆。无所谓自转。其他不动
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = 0.*ones(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
% 从上往下第二段
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
%从上往下第三段
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 =  (a3max ).*ones(N,1);
a4 = 0 + (a4max - 0).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
%从上往外延展第一段
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min + (0 - a3min).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
%从上往外延展第二段，但是跟第一段有很多重合
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min.*ones(N,1);
a4 = a4min + (0 - a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
%从下往上第一段
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3max.*ones(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
%下往上第二段
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min + (a3max - a3min).*rand(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
%下往上第三段
clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min + (a4max - a4min).*rand(N,1);
for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on

% clear a0 a1 a2 a3 a4 x y z
% a0 = a0min .*ones(N,1);
% a1 = a1min + (a1max - a1min).*rand(N,1);
% a2 = a2min .*ones(N,1);
% a3 = a3min + (a3max - a3min).*rand(N,1);
% a4 = a4min + (a4max - a4min).*rand(N,1);
% for i=1:N
%     x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
%     y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
%     z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
% end
% 
% scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
% hold on
% 
% clear a0 a1 a2 a3 a4 x y z
% a0 = a0max .*ones(N,1);
% a1 = a1min + (a1max - a1min).*rand(N,1);
% a2 = a2max .*ones(N,1);
% a3 = a3min + (a3max - a3min).*rand(N,1);
% a4 = a4min + (a4max - a4min).*rand(N,1);
% for i=1:N
%     x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
%     y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
%     z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
% end
% 
% scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
% hold on
% 
% clear a0 a1 a2 a3 a4 x y z
% a0 = a0min .*ones(N,1);
% a1 = a1min + (a1max - a1min).*rand(N,1);
% a2 = a2max .*ones(N,1);
% a3 = a3min + (a3max - a3min).*rand(N,1);
% a4 = a4min + (a4max - a4min).*rand(N,1);
% for i=1:N
%     x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
%     y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
%     z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
% end
% 
% scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
% hold on
% 
% clear a0 a1 a2 a3 a4 x y z
% a0 = a0max .*ones(N,1);
% a1 = a1min + (a1max - a1min).*rand(N,1);
% a2 = a2min .*ones(N,1);
% a3 = a3min + (a3max - a3min).*rand(N,1);
% a4 = a4min + (a4max - a4min).*rand(N,1);
% for i=1:N
%     x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
%     y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
%     z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
% end
% 
% scatter3(x,y,z,1,z,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
% hold on

%%%----------------------------------------------------------------------------------------------------------------
%%%----------------------------------------------------------------------------------------------------------------
clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 =  (a3max ).*ones(N,1);
a4 =  (a4max ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  (a3max ).*ones(N,1);
a4 =  (a4max ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max.*ones(N,1);
a1 = 25 + (a1max - 25).*rand(N,1);
a2 = a2max .*ones(N,1);
a3 = 0.*ones(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min.*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (4 - a3min).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min.*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min +(0-a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min.*ones(N,1);
a1 = 12 + (a1max - 12).*rand(N,1);
a2 = a2min .*ones(N,1);
a3 = 0.*ones(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max.*ones(N,1);
a1 = a1min .*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min + (24 - a3min).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max.*ones(N,1);
a1 = a1min .*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min +(0-a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  a3min + (0 - a3min).*rand(N,1);
a4 =  0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  (a3min ).*ones(N,1);
a4 =  (a4min ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 =  (a3min ).*ones(N,1);
a4 =  (a4min ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 =a2min.*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min + (a4max - a4min).*rand(N,1);
for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (0 - a3min).*rand(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min + (a4max - a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2max.*ones(N,1);
a3 = a3max.*ones(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min.*ones(N,1);
a3 = a3max.*ones(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = (a1min ).*ones(N,1);
a2 = a2min.*ones(N,1);
a3 = 25 + (a3max - 25).*rand(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 =  (a3max ).*ones(N,1);
a4 = 0 + (a4max - 0).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  (a3max ).*ones(N,1);
a4 = 0 + (a4max - 0).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','k');
hold on

%%%%----------------------------------------------------------------------------------------------------------------
%%%%----------------------------------------------------------------------------------------------------------------
%%%%----------------------------------------------------------------------------------------------------------------
%To plot the workspace boundary, extensive random trials are not necessary.
N=1000;%选择N个随机点
%The human thumb has a complex structure, with variations in the distribution of its degrees of freedom across different anatomy textbooks. 
%For easy comparison, in this work, the range of motion of the human thumb joints has been expanded to match that of the prosthetic hand.
%The range of motion of the human hand thumb joints in Supplementary Table 6
% a0min=-8.5;a0max=8.5;
% a1min=-24;a1max=36;a2min=-20;a2max=30;
% a3min=-30;a3max=60;a4min=0;a4max=75;
%Readers can modify the program themselves to obtain results regarding the workspace of the finger.
%The range of motion of the human hand thumb joints actually used in this program,larger than that presented in Supplementary Table 6
a0min=-25;a0max=38;
a1min=-27;a1max=45;a2min=-20;a2max=35;
a3min=-40;a3max=60;a4min=0;a4max=75;


clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 =  (a3max ).*ones(N,1);
a4 =  (a4max ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  (a3max ).*ones(N,1);
a4 =  (a4max ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max.*ones(N,1);
a1 = 25 + (a1max - 25).*rand(N,1);
a2 = a2max .*ones(N,1);
a3 = 0.*ones(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min.*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (4 - a3min).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min.*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min +(0-a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min.*ones(N,1);
a1 = 12 + (a1max - 12).*rand(N,1);
a2 = a2min .*ones(N,1);
a3 = 0.*ones(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max.*ones(N,1);
a1 = a1min .*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min + (24 - a3min).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max.*ones(N,1);
a1 = a1min .*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min +(0-a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end
scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  a3min + (0 - a3min).*rand(N,1);
a4 =  0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min + (a0max - a0min).*rand(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  (a3min ).*ones(N,1);
a4 =  (a4min ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 =  (a3min ).*ones(N,1);
a4 =  (a4min ).*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 =a2min.*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min + (a4max - a4min).*rand(N,1);
for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (0 - a3min).*rand(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min .*ones(N,1);
a4 = a4min + (a4max - a4min).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2max.*ones(N,1);
a3 = a3max.*ones(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min.*ones(N,1);
a3 = a3max.*ones(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = (a1min ).*ones(N,1);
a2 = a2min.*ones(N,1);
a3 = 25 + (a3max - 25).*rand(N,1);
a4 = a4max.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 0.*ones(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0min .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 =  (a3max ).*ones(N,1);
a4 = 0 + (a4max - 0).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

clear a0 a1 a2 a3 a4 x y z
a0 = a0max .*ones(N,1);
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 =  (a3max ).*ones(N,1);
a4 = 0 + (a4max - 0).*rand(N,1);

for i=1:N
    x(i)=(5*cos((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 - (81*sin((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 - 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180)) + 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*cos((pi*a3(i))/180)) - (152*cos((pi*a3(i))/180)*(sin((pi*a0(i))/180)*sin((pi*a2(i))/180) - cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a0(i))/180)*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a0(i))/180)*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/5;
    y(i)=(81*cos((pi*a0(i))/180)*sin((pi*a2(i))/180))/2 + (5*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + 20*cos((pi*a4(i))/180)*(cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) + cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(sin((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)) - cos((pi*a1(i))/180)*cos((pi*a3(i))/180)*sin((pi*a0(i))/180)) + (152*cos((pi*a3(i))/180)*(cos((pi*a0(i))/180)*sin((pi*a2(i))/180) + cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180)))/5 + (81*cos((pi*a2(i))/180)*sin((pi*a0(i))/180)*sin((pi*a1(i))/180))/2 + (152*cos((pi*a1(i))/180)*sin((pi*a0(i))/180)*sin((pi*a3(i))/180))/5;
    z(i)=(5*cos((pi*a1(i))/180))/2 + (81*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/2 - (152*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/5 - 20*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)) - 20*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)) + (152*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/5;
end

scatter3(x,y,z,pointsize,'.','r');
hold on

% plot3([-50,5],[-20,5],[0,5],'linewidth',1,'color','k')
view([55,10]);
% set(gca,'xtick',[]);set(gca,'ytick',[]);set(gca,'ztick',[]);
axis equal
set(gca,'ztick',-20:20:80);

set(gcf,'unit','centimeters','position',[15 3 20 20]);
set(gca,'FontName','Myriad Pro','FontSize',16,'LineWidth',2,'TickLength',[0.01,0.01]);
% grid on
