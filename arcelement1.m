function s = arcelement1(t)
%
%   Determines the arclength element for the paramterized curve
%        given in Sauer Chp.5, Reality Check 5
%
xp = 0.3 + 7.8*t - 14.1*t.^2;
yp = 0.3 + 1.8*t -  8.1*t.^2;
s = sqrt(xp.^2+yp.^2);