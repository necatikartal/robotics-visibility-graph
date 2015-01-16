% ************************************************************************
% File Name   : equalVertices.m
%               (funciton m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will check if the vertices are equal.
%               Input : Two vertices as v1 and v2.
%               Output: Return 0 if v1 and v2 not same or return 1 if
%                       v1 and v2 same.
% ************************************************************************

function [ result ] = equalVertices( v1,v2 )

if((v1(1,1) == v2(1,1)) && (v1(1,2) == v2(1,2)))
    result = 1;
else
    result = 0;
end

end