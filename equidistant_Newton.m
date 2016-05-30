%Graphs equidistant points along the curve using newtons method to find the
%values for t
%returns the x and y values of the points 

function [xk yk] = equidistant_Newton(n)
% Script plotcuve
%
% Plots the curve given in Sauer, Chp.5, Reality Check 5
%       and calculates the arclength
%
%   calls curve1.m  and arcelement1.1 and Suaer's adapquad.m
%
t = [0:0.01:1];
%
[x y] = curve1(t);
%
figure(1);
%
H1 = plot(x,y,'LineWidth',2);
set(gca,'LineWidth',2,'FontWeight','bold','FontSize',12);
xlabel('x');
ylabel('y');
title('Equidistant Points');
xlim([-0.5 1.5]);
ylim([-0.5 2]);
%
% Add a few specific points to the curve
%    and add axes
%
hold on
%get equidistant values of t to plot
tk = [];
for i=1:n-1
    s = 1/n * i;
    tk(i+1) = findT_Newton(s);
end;
%add the 0 point and the endpoint since these are always the same 
%(saves computing time)
tk(1) = 0;
tk(n+1) = 1;

[xk yk] = curve1(tk);
plot(xk,yk,'b.','MarkerSize',20);
%
plot(t*10-5,t*0,'k--','LineWidth',1);
plot(t*0,t*10-5,'k--','LineWidth',1);
hold off
%
% Add more of the curve beyond the desired range of t
%    notice how sharply the curve turns at t=0
%
hold on
tt = [-3:0.1:3];
[xx yy] = curve1(tt);
plot(xx,yy,'b--','LineWidth',1);
hold off

%
% calculate the arclength using adapquad
%
t0 = t(1);
t1 = t(end);
tol = 10.^-6;
arc1 = adapquad(@arcelement1, t0, t1, tol);
disp(sprintf('The arclength for t=%i to t=%i is %f.',t0,t1,arc1));