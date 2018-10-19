function [] = genPlotFile(prefix, titleString, yString, t, reference, state, stateLegend)
    fig = figure;
    title(titleString);
    ylabel(yString);
    xlabel('Time [s]');
    hold on;
    plot(t, state, 'b');
    plot(t, reference, 'r');
    legend({'Measured', stateLegend}, 'Location','southeast');
    hold off;
    filename = strrep(titleString, ' ', '_');
    filepath = strcat('../Common/figures/', prefix, '_', filename);
    savefig(fig, strcat(filepath, '.fig'));
    saveas(fig, filepath, 'epsc');
    %close(fig);
end