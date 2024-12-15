%手指工作空间的点云图
clear
clc
%The DIP and PIP joints of the index finger are connected by a four-bar linkage, resulting in a complex angular relationship. 
%To simplify, we assume that the two angles are proportional. 
%This assumption is supported by the actual working conditions of our prosthetic hand and does not affect the conclusions.
%The range of motion of the prostheitic hand index finger joints, same as Supplementary Table 6
a1min=-20;a1max=90;a2min=-22;a2max=22;
a3min=-11;a3max=90;a4min=-15;a4max=80;

%Too many random trials will consume a significant amount of time and computer resources. 
%Moreover, due to diminishing returns, the improvement in simulation accuracy will be minimal. 
%We recommend conducting no more than 100,000 random trials, with 50,000 being ideal, to ensure quick results.
N=1000000;%选择N个随机点
pointsize=30;

% a1 = a1min + (a1max - a1min).*rand(N,1);
% a2 = a2min + (a2max - a2min).*rand(N,1);
% a3 = a3min + (a3max - a3min).*rand(N,1);
% a4 = 105/101 * a3;
% for i=1:N
%     x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
%     y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
%     z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
% %     m(i)=sqrt(x(i)*x(i) + y(i)*y(i) +z(i)*z(i));
% %     co=col_cul(x(i),1,1);
% %     c(i,1)=co(1);
% %     c(i,2)=co(2);
% %     c(i,3)=co(3);
% end
% 
% scatter3(-y,z,x,10,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
% hold on
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = 0.*ones(N,1);
a4 = 105/101*a3;

for i=1:0.5*N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,1,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on

clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min + (0 - a3min).*rand(N,1);
a4 = 105/101*a3;

for i=1:0.05*N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,1,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on

clear a1 a2 a3 a4 x y z
a1 = a1max.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 105/101 * a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,1,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on

clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3max .*ones(N,1);
a4 = 105/101 * a3;

for i=1:0.1*N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,1,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on

clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min + (a3max - a3min).*rand(N,1);
a4 = 105/101 * a3;

for i=1:0.1*N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,1,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on

clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min + (a3max - a3min).*rand(N,1);
a4 = 105/101 * a3;

for i=1:0.5*N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,1,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on

clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (a3max - a3min).*rand(N,1);
a4 = 105/101 * a3;

for i=1:0.5*N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,1,x,'filled','MarkerFaceAlpha',0.15,'MarkerEdgeAlpha',0.15);
hold on
%-------------------------------------------------------------------------------------------------
% % %工作空间和边框，前面上方
clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min.*ones(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min .*ones(N,1);
a3 = 0.*ones(N,1);
a4 =  a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min + (0-a3min).*rand(N,1);
a4 = 105/101* a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2max .*ones(N,1);
a3 = 0.*ones(N,1);
a4 = 105/101 * a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (0-a3min).*rand(N,1);
a4 = 105/101* a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
% %-------------------------------------------------------------------------------------------------
% %工作空间和边框，前面下方
clear a1 a2 a3 a4 x y z
a1 = a1max.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
% scatter3(-y,z,x,1,'.','g');
scatter3(-y,z,x,pointsize,'.','k');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
% scatter3(-y,z,x,1,'.','g');
scatter3(-y,z,x,pointsize,'.','k');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1max.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3max .*ones(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
% scatter3(-y,z,x,1,'.','g');
scatter3(-y,z,x,pointsize,'.','k');
hold on
% %-------------------------------------------------------------------------------------------------
%工作空间和边框，后面下方
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min .*ones(N,1);
a3 = 90.*ones(N,1);
a4 = 105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2max .*ones(N,1);
a3 = 90.*ones(N,1);
a4 = 105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3max.*ones(N,1);
a4 = 105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
% %-------------------------------------------------------------------------------------------------
% %工作空间和边框，后面上方
clear a1 a2 a3 a4 x y z
a1 = a1min.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min + (90 - a3min).*rand(N,1);
a4 =105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (90 - a3min).*rand(N,1);
a4 =105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','k');
% scatter3(-y,z,x,1,x,'filled');
hold on
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------
%--------------------------------------------------------------------------------------------------------------------------------------------------
%人手工作空间
% % %工作空间和边框，前面上方
%The human index finger’s swing motion is constrained by lateral stiffness during bending, which limits its swing amplitude. 
%For easy comparison, we did not consider this limitation
%The range of motion of the human hand index finger joints, same as Supplementary Table 6
a1min=-16;a1max=85;a2min=-20;a2max=20;
a3min=-5;a3max=103;a4min=-4;a4max=71;
N=1000;%选择N个随机点
pointsize=30;

clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3min.*ones(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min .*ones(N,1);
a3 = 0.*ones(N,1);
a4 =  a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min + (0-a3min).*rand(N,1);
a4 = 105/101* a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2max .*ones(N,1);
a3 = 0.*ones(N,1);
a4 = 105/101 * a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (0-a3min).*rand(N,1);
a4 = 105/101* a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
% %-------------------------------------------------------------------------------------------------
% %工作空间和边框，前面下方
clear a1 a2 a3 a4 x y z
a1 = a1max.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
% scatter3(-y,z,x,1,'.','g');
scatter3(-y,z,x,pointsize,'.','r');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1max.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = 0 + (a3max - 0).*rand(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
% scatter3(-y,z,x,1,'.','g');
scatter3(-y,z,x,pointsize,'.','r');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1max.*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3max .*ones(N,1);
a4 = 105/101 * a3;
for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
% scatter3(-y,z,x,1,'.','g');
scatter3(-y,z,x,pointsize,'.','r');
hold on
% %-------------------------------------------------------------------------------------------------
%工作空间和边框，后面下方
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2min .*ones(N,1);
a3 = a3max.*ones(N,1);
a4 = 105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min + (a1max - a1min).*rand(N,1);
a2 = a2max .*ones(N,1);
a3 = a3max.*ones(N,1);
a4 = 105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min .*ones(N,1);
a2 = a2min + (a2max - a2min).*rand(N,1);
a3 = a3max.*ones(N,1);
a4 = 105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
% %-------------------------------------------------------------------------------------------------
% %工作空间和边框，后面上方
clear a1 a2 a3 a4 x y z
a1 = a1min.*ones(N,1);
a2 = a2min .*ones(N,1);
a3 = a3min + (a3max - a3min).*rand(N,1);
a4 =105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
clear a1 a2 a3 a4 x y z
a1 = a1min.*ones(N,1);
a2 = a2max .*ones(N,1);
a3 = a3min + (a3max - a3min).*rand(N,1);
a4 =105/101*a3;

for i=1:N
    x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
    y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
    z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
end
scatter3(-y,z,x,pointsize,'.','r');
% scatter3(-y,z,x,1,x,'filled');
hold on
% % %-------------------------------------------------------------------------------------------------
% % %-------------------------------------------------------------------------------------------------
view([55,10]);
xlabel('\fontname{Myriad Pro}\fontsize{20}x (mm)','VerticalAlignment','middle') 
ylabel('\fontname{Myriad Pro}\fontsize{20}y (mm)','VerticalAlignment','middle','HorizontalAlignment','center')
zlabel('\fontname{Myriad Pro}\fontsize{20}z (mm)','VerticalAlignment','middle')
title('\fontname{Myriad Pro}\fontsize{16}Point Cloud Map of Index Workspace')
% set(gca,'xtick',[]);set(gca,'ytick',[]);set(gca,'ztick',[]);
axis equal
set(gcf,'unit','centimeters','position',[15 3 18 18]);
set(gca,'FontName','Myriad Pro','FontSize',16,'LineWidth',2,'TickLength',[0.01,0.01]);
grid on
% print('untitled.eps','-depsc','-painters');
%-------------------------------------------------------------------------------------------------
% 点云表达式
% syms a0(i) a1(i) a2(i) a3(i) a4(i)
% p0=[19.5 0 0 1]';
% T00=[ 0.1971   -0.9747    0.1003    2.0100
%         -0.2038   -0.1450   -0.9678  -29.8200
%        0.9590    0.1700   -0.2307   89.6600
%           0         0         0    1.0000];
% 
% T01=[cosd(-a1(i))  -sind(-a1(i))    0      0
%      sind(-a1(i))   cosd(-a1(i))    0      0
%        0          0                 1      0
%        0          0                 0      1  ];
%    
%    
% T12=[cosd(a2(i)) -sind(a2(i))  0    2.6
%        0        0        1    0
%     -sind(a2(i)) -cosd(a2(i))  0    0
%        0        0        0    1 ];
%    
%    
% T23=[cosd(a3(i)) -sind(a3(i))  0    35.4
%        0        0        1    0
%     -sind(a3(i)) -cosd(a3(i))  0    0
%        0        0        0    1 ];
%   
%   
% T34=[cosd(a4(i))  -sind(a4(i))    0      24.5
%      sind(a4(i))   cosd(a4(i))    0      0
%        0          0         1            0
%        0          0         0            1  ]; 
% 
% p1 = T01*T12*T23*T34*p0;
% disp(p1);
%%%----------------------------------------------------------------------------------------------------------
% clear a1 a2 a3 a4 x y z
% a1 = a1min + (a1max - a1min).*rand(N,1);
% a2 = 0 .*ones(N,1);
% a3 = 0.*ones(N,1);
% a4 =  a3;
% for i=1:N
%     x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
%     y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
%     z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
% end
% scatter3(-y,z,x,pointsize,'.','k');
% % scatter3(-y,z,x,1,x,'filled');
% hold on
% 
% clear a1 a2 a3 a4 x y z
% a1 = a1min .*ones(N,1);
% a2 = 0 .*ones(N,1);
% a3 = a3min + (0-a3min).*rand(N,1);
% a4 = 105/101* a3;
% for i=1:N
%     x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
%     y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
%     z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
% end
% scatter3(-y,z,x,pointsize,'.','k');
% % scatter3(-y,z,x,1,x,'filled');
% hold on
% clear a1 a2 a3 a4 x y z
% a1 = a1max.*ones(N,1);
% a2 = 0 .*ones(N,1);
% a3 = 0 + (a3max - 0).*rand(N,1);
% a4 = 105/101 * a3;
% for i=1:N
%     x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
%     y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
%     z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
% end
% % scatter3(-y,z,x,1,'.','g');
% scatter3(-y,z,x,pointsize,'.','k');
% hold on
% clear a1 a2 a3 a4 x y z
% a1 = a1min + (a1max - a1min).*rand(N,1);
% a2 = 0 .*ones(N,1);
% a3 = 90.*ones(N,1);
% a4 = 105/101*a3;
% 
% for i=1:N
%     x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
%     y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
%     z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
% end
% scatter3(-y,z,x,pointsize,'.','k');
% % scatter3(-y,z,x,1,x,'filled');
% hold on
% clear a1 a2 a3 a4 x y z
% a1 = a1min.*ones(N,1);
% a2 = 0 .*ones(N,1);
% a3 = a3min + (90 - a3min).*rand(N,1);
% a4 =105/101*a3;
% 
% for i=1:N
%     x(i)=(13*cos((pi*a1(i))/180))/5 + (177*cos((pi*a1(i))/180)*cos((pi*a2(i))/180))/5 - (49*sin((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(sin((pi*a1(i))/180)*sin((pi*a3(i))/180) - cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a3(i))/180)*sin((pi*a1(i))/180) + cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*sin((pi*a3(i))/180)))/2 + (49*cos((pi*a1(i))/180)*cos((pi*a2(i))/180)*cos((pi*a3(i))/180))/2;
%     y(i)=- (13*sin((pi*a1(i))/180))/5 - (177*cos((pi*a2(i))/180)*sin((pi*a1(i))/180))/5 - (49*cos((pi*a1(i))/180)*sin((pi*a3(i))/180))/2 - (39*cos((pi*a4(i))/180)*(cos((pi*a1(i))/180)*sin((pi*a3(i))/180) + cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180)))/2 - (39*sin((pi*a4(i))/180)*(cos((pi*a1(i))/180)*cos((pi*a3(i))/180) - cos((pi*a2(i))/180)*sin((pi*a1(i))/180)*sin((pi*a3(i))/180)))/2 - (49*cos((pi*a2(i))/180)*cos((pi*a3(i))/180)*sin((pi*a1(i))/180))/2;
%     z(i)=(39*sin((pi*a2(i))/180)*sin((pi*a3(i))/180)*sin((pi*a4(i))/180))/2 - (49*cos((pi*a3(i))/180)*sin((pi*a2(i))/180))/2 - (39*cos((pi*a3(i))/180)*cos((pi*a4(i))/180)*sin((pi*a2(i))/180))/2 - (177*sin((pi*a2(i))/180))/5;
% end
% scatter3(-y,z,x,pointsize,'.','k');
% % scatter3(-y,z,x,1,x,'filled');
% hold on
% view([0,0]);
% axis equal
% xlim([-60,180])
% ylim([-60,60])
% zlim([-60,160])
% set(gcf,'unit','centimeters','position',[15 3 18 18]);
% set(gca,'FontName','Myriad Pro','FontSize',16,'LineWidth',2,'TickLength',[0.01,0.01]);
% grid off