% ************************************************************************
% File Name   : calculateVertices.m
%               (function m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will calculate vertices by using inputs.
%               Input : Inputs from text file.
%               Output: Vertices.
% ************************************************************************

function [vertices] = calculateVertices( inputs )

%Create vertices
k=1;
vertices = zeros(sum(inputs(:,1)),3);
for i=1:size(inputs,1)
    for j=2:2:inputs(i)*2+1
        vertices(k,:)=[inputs(i,j:j+1),k];
        k = k+1;
    end
end

end