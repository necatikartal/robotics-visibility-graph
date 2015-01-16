% ************************************************************************
% File Name   : isLineSegmentsIntersect.m
%               (function m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will check if two line segments intersect. 
%               To desing solution, there is using algorithm from 
%               "Intersection of two lines in three-space" by
%               Ronald Goldman.
%               Input : 4 Inputs; First two inputs are two points of first
%                       line as l1v1,l1v2 and second two inputs are two 
%                       points of second line as l2v1,l2v2.
%               Output: Return 1 if lines are intersect or return 0 if 
%                       lines are not intersect.
% ************************************************************************

function [ result ] = isLineSegmentsIntersect( l1v1,l1v2,l2v1,l2v2 )

r = subtractVertices(l1v2, l1v1);
s = subtractVertices(l2v2, l2v1);

numerator = crossProduct(subtractVertices(l2v1, l1v1), r);
denominator = crossProduct(r, s);

%Check collinear situation.
if(numerator == 0 && denominator == 0) 
    
    %Check equal vertex if its exist or not.
    if (equalVertices(l1v1, l2v1) || equalVertices(l1v1, l2v2) || equalVertices(l1v2, l2v1) || equalVertices(l1v2, l2v2)) 
        result = 1;
    end
    
    %Check overlap situation.
    if ((l2v1(1,1) - l1v1(1,1) < 0) ~= (l2v1(1,1) - l1v2(1,1) < 0) ~= (l2v2(1,1) - l1v1(1,1) < 0) ~= (l2v2(1,1) - l1v2(1,1) < 0)) || ((l2v1(1,2) - l1v1(1,2) < 0) ~= (l2v1(1,2) - l1v2(1,2) < 0) ~= (l2v2(1,2) - l1v1(1,2) < 0) ~= (l2v2(1,2) - l1v2(1,2) < 0))
        result = 1;
    else
        result = 0;
    end
end

%Check paralel situation.
if(denominator == 0)
    result = 0;
end

u = numerator / denominator;
t = crossProduct(subtractVertices(l2v1, l1v1), s) / denominator;

%Check meeting vertex.
if((t >= 0) && (t <= 1) && (u >= 0) && (u <= 1))
    result = 1;
else
    result = 0;
end

end