% ************************************************************************
% File Name   : subtractVertices.m
%               (function m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will subtract the second vertex from the first.
%               Input : Two vertices as v1 and v2.
%               Output: Return subract as result.
% ************************************************************************

function [ result ] = subtractVertices( v1, v2 )

result(1,1) = v1(1,1) - v2(1,1);
result(1,2) = v1(1,2) - v2(1,2);

end