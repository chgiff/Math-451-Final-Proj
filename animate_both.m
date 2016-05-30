%animate with a constant distance between steps and with a constant time
%between steps

%inputs are equally spaced points along the curve

function animate_both(xs,ys)
figure(2);
set(gca, 'XLim', [-2,2], 'YLim', [-2,2], 'Drawmode', 'fast', 'Visible', 'on');
cla
axis square

%ball for const distance
ball_s = line('color', 'r', 'Marker', 'o', 'MarkerSize', 10, 'LineWidth', 2, ... 
    'erase', 'xor', 'xdata', [], 'ydata', []);

%ball for const time
ball_t = line('color', 'g', 'Marker', 'o', 'MarkerSize', 10, 'LineWidth', 2, ... 
    'erase', 'xor', 'xdata', [], 'ydata', []);

%points for drawing the static curve
t = [0:0.05:1];
[x y] = curve1(t);

%number of points
n = length(xs);

%points with equal time spacing
t = linspace(0,1,n);
[xt yt] = curve1(t);

i = 1;
%run animate loop 5 times
for j=0:5
    while i <= n
        % move const distance ball to next xs position
        set(ball_s, 'xdata', xs(i), 'ydata', ys(i));
        % move const time ball to next xt position
        set(ball_t, 'xdata', xt(i), 'ydata', yt(i));
        
        drawnow;
        % redraw plot every time in loop
        hold on;
        plot(x,y,'b','LineWidth',2);
        xlabel('x');
        ylabel('y');
        xlim([-0.5 1.5]);
        ylim([-0.5 2]);
        title({'Constant Arc Length Parameterization In Red','Constant Time Parameterization In Green'});
        hold off;
        %total animation time will be 4 seconds so pause is 4/n
        pause(4/n);
        i = i + 1;
    end
    i = 1;
end