% ************************************************************************
% File Name   : start.m
%               (blank m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will build workspace and obtstacles 
%               from giving inputs.txt file.
%               Input : Text file which is form by coordinates 
%                       data of workspace and obstacles.
%               Output: Drawing workspace and obstacles and create
%                       vertices of them.
% ************************************************************************

try
    %Set everything to default.
    clear; close all; clc;

    %Read data from 'inputs.txt' file.
    inputs = dlmread('inputs.txt'); %Do not change name of field.
    
    %Build environment.
    buildEnvironment();  %For clean desing, it's sperated. 

    %Create vertices.
    vertices = calculateVertices(inputs); % M x 3 matrices. (x,y,number)
    
    %Calculate edges.
    edges = calculateEdges(inputs); % N x 2 matrices. (vfirst, vlast)
    
    %Cleer unnecessary fields.
    clear inputs
   
    %Press success message.
    disp('Project is builded!');
    
    %Run rotatinal plane sweep algorithm.
    disp('Rotatinal plane sweep algorithm is started!');
    for i=1:size(vertices,1)
        pause %Plot step by step for each vertex.
        fprintf('%2d. Vertex is processing... \n', i);
        rpsa(vertices,edges,i); %Call rotational plane sweep algorithm.  
    end

    %Cleer unnecessary fields.
    clear vertices;
    clear edges;
    clear i;
    
    %Press final message.
    disp('Project is finished!');
    
catch err

    %Press error message.
    rethrow(err);
    
end  % end try/catch