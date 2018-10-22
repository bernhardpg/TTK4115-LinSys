function [] = genPlotFile(prefix, titleString, yString, t, reference, state, stateLegend)
    fig = figure;
    title(titleString);
    ylabel(yString);
    xlabel('Time [s]');
    hold on;
    plot(t, reference, 'r');
    plot(t, state, 'b');
    legend({'Measured', stateLegend}, 'Location','southeast');
    hold off;
    filename = strrep(titleString, ' ', '_');
    filepath = strcat('figures/', prefix, '_', filename);
    savefig(fig, strcat(filepath, '.fig'));
    saveas(fig, filepath, 'epsc');
    %close(fig);
end