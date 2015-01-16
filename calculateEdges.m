% ************************************************************************
% File Name   : calculateEdges.m
%               (function m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will calculate edges by using inputs.
%               Input : Inputs from text file.
%               Output: Edges.
% ************************************************************************

function [ edges ] = calculateEdges(inputs)

%Create edges
k=1;
edges = zeros(sum(inputs(:,1)),2);
for i=1:size(inputs,1)
    for j=1:inputs(i)-1
        edges(k,:)=[k; k+1];
        k = k+1;
    end
    k = k+1;
    edges(k-1,:)=[k-1; k-inputs(i)];
end
    
end