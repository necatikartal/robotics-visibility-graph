% ************************************************************************
% File Name   : drawLine.m
%               (function m-file)
% Author      : H. Hilal EZERCAN KAYIR
% Date        : 04.11.2014
% Description : This m-file will draw line segment between given points 
%               on 2D plane.
%               Input : q1 and q2 points.
%                       q1 and q2 are column matrix which have x and y
%                       coordinator as parametres.
%               Output: Drawing line between q1 and q2 points.
% ************************************************************************

function drawLine(q1,q2,color)

x1=q1(1,1); % x coordinate of q1 point
y1=q1(2,1); % y coordinate of q1 point
x2=q2(1,1); % x coordinate of q2 point
y2=q2(2,1); % y coordinate of q2 point

m=(y2-y1)/(x2-x1); % gradient 

%Finding line function
if isinf(m) %If gradient is infinite
    step=0.005*(max(y1,y2)-min(y1,y2));
    y=min(y1,y2) :step: max(y1,y2);
    x=x1;
else
    step=0.005*(max(x1,x2)-min(x1,x2));
    x=min(x1,x2):0.01:max(x1,x2);
    y=m*(x-x1)+y1;
end

plot(x,y,'lineWidth',2,'color',color)

end