%% How one normally plots
t = 0:.01:1;
y = sin(8*pi*t);
plot(t, y);
xlabel('t [s]');
ylabel('A');
title('This is a sine, A = sin(8 pi t)');
%% Using plot_settings_font.m
hFig = figure;
hAx = axes;
plot(hAx, t, y);

x_label = '$t$ [s]'; % allows for latex formatting
y_label = '$A$';
title_label = 'This is a sine, $A = \mathrm{sin}(8 \pi t)$';
xlim = [0 1];
ylim = [-1 1];
xtick = xlim(1):0.2:xlim(2); % Easily change ticks
ytick = ylim(1):0.2:ylim(2);
fontsize = 16;
xgrid = 'on';
ygrid = 'on';
ax_equal = 0; % sometimes nice to have axis equal, not now
clr_bar = 0; % in this case there is no colorbar
clr_bar_title = []; % so the title is empty as well
save_images = 0; % we do not save
filepath = []; % empty, because we do not save

plot_settings_font(hAx, ...
                   x_label, y_label, title_label, ...
                   xlim, ylim, xtick, ytick, fontsize, ...
                   xgrid, ygrid, ax_equal, clr_bar, clr_bar_title,...
                   save_images, filepath)

%% Using plot_settings_font.m with colorbar and create paper-ready figures
x_range = -3:.05:3; % Create 2d airy function as an example
y_range = -3:.05:3;
[X, Y] = meshgrid(x_range, y_range);
Air = airy(sqrt(X.^2+Y.^2));
Air = Air/max(Air(:)); % normalize airy function

save_images = 1;
filepath = ['.\airy']; % let's save in current path indicated by .\

figure;
hAx = imagesc(x_range, y_range, Air);
plot_settings_font(gca, '$x$', '$y$', 'Airy disc', [-3 3], [-3 3], ...
                   -3:1:3, -3:1:3, 14, 'off', 'off', 1, [1 0 1], ...
                   'Ai($r$)', save_images, filepath);
% This saves 3 files: A matlab figure .fig, an easily viewable .png and
% a paper-ready .eps. We included the other parameters in one go this time.

