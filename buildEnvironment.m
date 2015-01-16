% ************************************************************************
% File Name   : buildEnvironment.m
%               (blank m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will build workspace and obtstacles from 
%               giving inputs matrices.
%               Input : Text file which is form by coordinates data 
%                       of workspace and obstacles.
%               Output: Create and draw workspace and obstacles field.
% ************************************************************************

%Create workspace.
workspace = [inputs(1,2:2:inputs(1)*2+1); inputs(1,3:2:inputs(1)*2+1)];

%Create obstacles.
for i=2:size(inputs,1),
    eval(['obstacle' num2str(i-1) '= [inputs(i,2:2:inputs(i)*2+1); inputs(i,3:2:inputs(i)*2+1)];']);
end

%Draw workspace.
drawPolygon(workspace)

title('VISIBILITY GRAPH')
hold on

%Draw obstacles.
for i=2:size(inputs,1),
    drawPolygon(eval(['obstacle' num2str(i-1)]));
end

%Cleer unnecessary fields.
clear i
clear j
clear k