function [] = genPlotFile(prefix, titleString, xLabel, yLabel, xArray, plot1, plot2, plot1Legend, plot2Legend)
    fig = figure;
    title(titleString);
    ylabel(yLabel);
    xlabel(xLabel);
    hold on;
    plot(xArray, plot1, 'b');
    
    if size(plot2, 2) ~= 0
        plot(xArray, plot2, 'r');
    end
    
    legend({plot1Legend, plot2Legend}, 'Location','southeast', 'Interpreter', 'Latex', 'FontSize', 14);
    hold off;
    filename = strrep(titleString, ' ', '_');
    filepath = strcat('../Common/figures/', prefix, '_', filename);
    savefig(fig, strcat(filepath, '.fig'));
    saveas(fig, filepath, 'epsc');
    %close(fig);
end