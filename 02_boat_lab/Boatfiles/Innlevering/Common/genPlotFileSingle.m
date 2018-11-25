function [] = genPlotFileSingle(prefix, titleString, xLabel, yLabel, xArray, plot1, plot1Legend)
    fig = figure;
    title(titleString);
    grid on;
    ylabel(yLabel);
    xlabel(xLabel);
    hold on;
    plot(xArray, plot1, 'b');    
    legend({plot1Legend}, 'Location','northeast', 'Interpreter', 'Latex', 'FontSize', 14);
    hold off;
    axis([0 xArray(end) min(plot1) max(plot1) * 1.25]);
    
    pbaspect([3.5 1 1]);
    filename = strrep(titleString, ' ', '_');
    filepath = strcat('../Common/figures/', prefix, '_', filename);
    savefig(fig, strcat(filepath, '.fig'));
    saveas(fig, filepath, 'epsc');
    %close(fig);
end