% An example how to custom sub-plot with TIGHT axis good making plot images
% for presentations and documents. This example is a 3 by 4, note the
% loops! Requires a <dataset>! Each axis is 1 to 1 aspect ratio!

N_plot_in_x = 4;
N_plot_in_y = 3;

% Creat fake dataset
for I = 1:N_plot_in_x*N_plot_in_y
    [data_set{I}.X, data_set{I}.Y] = ...
        pol2cart((rand(50,1)*2-1)*pi, sqrt(rand(50,1))*150);
end

hFig = figure('Position', [250 200 900 675]); % These are your monitor coordinates! Make sure to adapt these to have proper aspect ratio


for I = 1:N_plot_in_y
    for J = 1:N_plot_in_x

        hAx = axes(hFig, 'Position', [(J-1)/N_plot_in_x (N_plot_in_y-I)/N_plot_in_y 1/N_plot_in_x 1/N_plot_in_y], 'Visible', 'off', ...
            'XLim', [-152 152], 'YLim', [-152 152], 'NextPlot', 'add');
        plot(hAx, data_set{N_plot_in_x*(I-1)+J}.X, data_set{N_plot_in_x*(I-1)+J}.Y, 'k.');
        rectangle(hAx, 'Position', [-150 -150 2*150 2*150], ...
            'Curvature', [1 1], 'EdgeColor', 'r', 'LineWidth', 1.5);

    end
end

print('.\test.png', '-dpng', '-r150');