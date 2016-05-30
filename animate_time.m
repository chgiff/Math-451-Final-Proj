%animate with a constant time between steps
function animate_time(n)
figure(2);
set(gca, 'XLim', [-2,2], 'YLim', [-2,2], 'Drawmode', 'fast', 'Visible', 'on');
cla
axis square

ball = line('color', 'r', 'Marker', 'o', 'MarkerSize', 10, 'LineWidth', 2, ... 
    'erase', 'xor', 'xdata', [], 'ydata', []);

t = linspace(0,1,n);
[x y] = curve1(t);

i = 1; 
%run animation loop 5 times
for j=0:5
    %animation loop
    while i <= n
        % move ball to next xk position
        set(ball, 'xdata', x(i), 'ydata', y(i));
        drawnow;
        % redraw plot every time in loop
        hold on;
        plot(x,y, 'b', 'LineWidth', 2);
        xlabel('x');
        ylabel('y');
        xlim([-0.5 1.5]);
        ylim([-0.5 2]);
        title('Constant Time Parameterization');
        hold off;
        %total animation time will be 4 seconds so pause is 4/n
        pause(4/n);
        i = i + 1;
    end
    i = 1;
end