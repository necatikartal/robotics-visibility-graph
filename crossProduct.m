% ************************************************************************
% File Name   : crossProduct.m
%               (function m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will calculate the cross product of the two
%               vertices.
%               Input : Two vertices as v1 and v2.
%               Output: Cross product by using v1 and v2.
% ************************************************************************

function [ result ] = crossProduct( v1,v2 )

result = v1(1,1) * v2(1,2) - v1(1,2) * v2(1,1);

end