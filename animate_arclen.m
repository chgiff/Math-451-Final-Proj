%animate with a constant distance between steps
function animate_arclen(xk,yk)
figure(3);
set(gca, 'XLim', [-2,2], 'YLim', [-2,2], 'Drawmode', 'fast', 'Visible', 'on');
cla
axis square

ball = line('color', 'r', 'Marker', 'o', 'MarkerSize', 10, 'LineWidth', 2, ... 
    'erase', 'xor', 'xdata', [], 'ydata', []);

%points for drawling curve
t = [0:0.05:1];
[x y] = curve1(t);

%number of points
n = length(xk);

i = 1;
%run animate loop 5 times
for j=0:5
    while i <= n
        % move ball to next xk position
        set(ball, 'xdata', xk(i), 'ydata', yk(i));
        drawnow;
        % redraw plot every time in loop
        hold on;
        plot(x,y,'b','LineWidth',2);
        xlabel('x');
        ylabel('y');
        xlim([-0.5 1.5]);
        ylim([-0.5 2]);
        title('Constant Arc Length Parameterization');
        hold off;
        %total animation time will be 4 seconds so pause is 4/n
        pause(4/n);
        i = i + 1;
    end
    i = 1;
end