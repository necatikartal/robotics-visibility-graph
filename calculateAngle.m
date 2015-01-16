% ************************************************************************
% File Name   : calculateAngle.m
%               (function m-file)
% Author      : Necati KARTAL
% Date        : 15.01.2015
% Description : This m-file will calculates angle between v1 and v2.
%               Input : Two vertices as v1,v2.
%               Output: Angle between v1 and v2.
% ************************************************************************

function [angle] = calculateAngle( v1,v2 )

angle = atand((v2(1,2)-v1(1,2))/(v2(1,1)-v1(1,1)));

if((v2(1,1)-v1(1,1))>=0 && (v2(1,2)-v1(1,2))>=0)
    angle = angle; %Don't need to change.  I(+,+) Quadrant.
elseif((v2(1,1)-v1(1,1))<=0 && (v2(1,2)-v1(1,2))>=0)
    angle = 180 + angle; % II (?,+) Quadrant. 
elseif((v2(1,1)-v1(1,1))<=0 && (v2(1,2)-v1(1,2))<=0)
    angle = 270 + angle; % III (?,?) Quadrant.
else
    angle = 360 + angle; % IV (+,?) Quadrant. 
end

end

