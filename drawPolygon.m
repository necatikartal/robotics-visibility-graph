% ************************************************************
% File Name   : drawPolygon.m
%               (function m-file)
% Author      : H. Hilal EZERCAN KAYIR
% Date        : 04.11.2014
% Description : This m-file will draw obstacle from given corner
%               coordinates on 2D plane.
%               It uses 'drawLine.m' function.
%               Input : P matrix which keeps corner coordinates of the 
%               obstacle, for n-obstacle => P:2xn
%               Output: Draw obstacle.
% ************************************************************

function drawPolygon(P)

cornerNum=size(P,2); %Corner count of the obstacle

for i=1:cornerNum
    
    q1=P(:,i); %q1:First corner
    if i==cornerNum
        q2=P(:,1); %q2:Second corner
    else
        q2=P(:,i+1); %q2:Second corner
    end
    
    drawLine(q1,q2,'b') %Call 'drawLine.m' function
    hold on
end