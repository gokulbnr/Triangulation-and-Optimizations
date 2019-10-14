clc;
clear all;
close all;

[img,P]=geta01();

X=runTriangulation(P,img);

scatter3(X(1,:),X(2,:),X(3,:),'filled');
title('3-D cube reconstruction');
xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');
legend('3-D points');