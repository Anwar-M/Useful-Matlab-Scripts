% This code shows an example of a different kind of visualization. Run example to see.
% Do some doc and change values

clear all; clc; close all;
addpath('K:\co\ance\ance-ShieldingComparison\Results\beamforming_predictions code\bf files');
remove_points = 0;
more_lines = 0;
save_imgs = 0;

%% Plate
d_source_plate = [0.24 0.63 0.20 0.50 0.21 0.41 0.55 0.23 0.59];
s_source_array = [1.72 1.72 2.03 2.03 2.57 2.57 2.57 2.08 1.68];
Z_2000 = [1.75 0.57 2.60 1.14 1.69 1.20 0.92 1.11 1.08];
Z_4000 = [3.24 1.40 5.67 2.16 3.53 2.46 1.75 2.92 1.53];
Z_5000 = [3.05 1.23 5.71 2.44 3.25 2.10 1.76 3.24 1.67];
Z_OSPL = [1.95 0.93 2.98 1.33 2.52 1.82 1.24 2.06 1.38];

R_2000 = [0.6435 0.9334   0.7843 0.7539 0.3978 0.7090 .7946 0.6946 0.9178];
R_2500 = [0.7201 0.2213 0.8672 0.5335 0.1354 2.92e-4 0.0273 1.59e-5 0.0092];
R_3150 = [ 0.4236 0.2295  0.7344 0.3318 0.0298 0.0677 0.0756 0.0276 0.0145];
R_4000 = [ 0.4645 0.8945 0.1439 0.4618 0 0.6969 0.8281 0.5102 0.7403];
R_5000 = [ 0.6103 0.8622  0.5755 0.7128 0 0.5978 0.8013 0.2190 0.3046];

%Z_2000 = R_2000;
%Z_4000 = R_2500;
%Z_5000 = R_4000;
%Z_OSPL = R_5000;


% Remove some points off-centred
if remove_points
    d_source_plate(5:7) = [];
    s_source_array(5:7) = [];
    Z_2000(5:7) = [];
    Z_4000(5:7) = [];
    Z_5000(5:7) = [];
    Z_OSPL(5:7) = [];
end

xoff = 0.0175;
yoff = 0.0175;

hold on
scatter(s_source_array+xoff, d_source_plate, 50, Z_2000, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', 'o');
scatter(s_source_array-xoff, d_source_plate, 50, Z_4000, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', '^');
scatter(s_source_array, d_source_plate+yoff, 50, Z_5000, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', 'di');
scatter(s_source_array, d_source_plate-yoff, 50, Z_OSPL, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', 'sq');
    
viscircles([s_source_array(end-1:end).' d_source_plate(end-1:end).'], ...
            1.9*[xoff xoff], 'LineStyle',':', 'Color', 'k', ...
            'LineWidth', 1);
    
axis([1.5 3 0.1 0.8]);

xlim = get(gca, 'XLim');
ylim = get(gca, 'YLim');
set(gca, 'XTick', 1.5:.25:3);

if more_lines
    for I = 1:numel(d_source_plate)
        line([xlim(1) s_source_array(I)], d_source_plate(I)*[1 1], 'color', 0.5*[1 1 1], ...
            'LineWidth', 0.5, 'LineStyle', '--');
        line(s_source_array(I)*[1 1],[ylim(1) d_source_plate(I)], 'color', 0.5*[1 1 1], ...
            'LineWidth', 0.5, 'LineStyle', '--');
    end
end

grid on;
colorbar;
colormap(flipud(colormap('hot')));
hold off

leg = legend('2000 Hz', '4000 Hz', '5000 Hz', 'OSPL', 'Location', 'best');
set(leg, 'Interpreter', 'Latex');
plot_settings(gca, '$d_{\mathrm{array}}$ [m]', '$d_{\mathrm{object}}$ [m]', [], [1.5 (2.3+~remove_points*0.4)],[0.1 0.8], 1.5:(0.1+~remove_points/10):(2.3+~remove_points*0.4), 0.1:0.1:0.8, 'on', 'on', 0, [1 0 6], [], save_imgs, ['.\Plate_source']);

%% Wing
d_source_wing =  [0.38 0.56 0.88 0.40 0.51 0.71 0.35 0.45 0.75];

d_source_array = [1.81 1.99 2.31 2.24 2.35 2.56 3.00 3.10 3.40];

Z_2000_wing =    [2.48 2.37 1.91 2.78 2.39 2.31 3.50 2.80 2.33];

Z_4000_wing =    [4.32 3.33 2.59 4.18 3.92 2.92 6.05 5.24 3.64];

Z_5000_wing =    [3.16 3.08 2.55 3.49 2.96 2.78 4.67 4.10 2.77];

Z_OSPL_wing =    [2.81 2.24 2.11 2.86 2.54 2.13 3.46 2.99 2.40];

xoff = 0.025;
yoff = 0.025;

figure; hold on;
scatter(d_source_array+xoff, d_source_wing, 50, Z_2000_wing, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', 'o');
scatter(d_source_array-xoff, d_source_wing, 50, Z_4000_wing, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', '^');
scatter(d_source_array, d_source_wing+yoff, 50, Z_5000_wing, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', 'di');
scatter(d_source_array, d_source_wing-yoff, 50, Z_OSPL_wing, 'filled', ...
        'MarkerEdgeColor', 'k', 'Marker', 'sq');
    
axis([1.5 3.5 0.3 1]);

set(gca, 'XTick', 1.5:.25:3.5);

grid on;
colorbar;
colormap(flipud(colormap('hot')));
hold off

leg = legend('2000 Hz', '4000 Hz', '5000 Hz', 'OSPL', 'Location', 'best');
set(leg, 'Interpreter', 'Latex');
plot_settings_font(gca, '$d_{\mathrm{array}}$ [m]', '$d_{\mathrm{object}}$ [m]', [], [1.5 3.5], [0.3 1], 1.5:0.25:3.5, 0.3:0.1:1, 14, 'on', 'on', 0, [1 0 6], [], save_imgs, ['.\Wing_source']);