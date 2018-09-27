%%
diro = 'O:\PhD Thesis\RESULTS\CH5\LOUDSPEAKER';
listt = dir([diro '\BF*.fig']);
for I = 1:length(listt)
    open([diro '\' listt(I).name]);
    set(gcf, 'PaperUnits','Points')
    set(gcf, 'PaperPositionMode', 'auto');
    set(gcf,'renderer','opengl');
    print([diro '\' listt(I).name(1:end-4)], '-depsc', '-r300');
    close;
end

%%
diro = 'O:\PhD Thesis\RESULTS\CH5\SPARKER';
listt = dir([diro '\BF*noflow*.fig']);
for I = 1:length(listt)
    open([diro '\' listt(I).name]);
    h = findobj(gca);
    h(6).LevelList = [h(6).LevelList(1):h(6).LevelList(end)];
    set(gcf, 'PaperUnits','Points')
    set(gcf, 'PaperPositionMode', 'auto');
    set(gcf,'renderer','opengl');
    print([diro '\' listt(I).name(1:end-4)], '-depsc', '-r300');
    close;
end
