function [x,y] = curve1(t)
%
%   Determines a point on the paramterized curve
%        given in Sauer Chp.5, Reality Check 5
%
x = 0.5 + 0.3*t+3.9*t.^2 - 4.7*t.^3;
y = 1.5 + 0.3*t+0.9*t.^2 - 2.7*t.^3;
 