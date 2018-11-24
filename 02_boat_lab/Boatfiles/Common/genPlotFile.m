function [] = genPlotFile(prefix, titleString, xLabel, yLabel, xArray, plot1, plot2, plot1Legend, plot2Legend)
    fig = figure;
    title(titleString);
    grid on;
    ylabel(yLabel);
    xlabel(xLabel);
    hold on;
    plot(xArray, plot1, 'b');
    
    if size(plot2, 2) ~= 0
        plot(xArray, plot2, 'r');
    end
    
    legend({plot1Legend, plot2Legend}, 'Location','northwest', 'Interpreter', 'Latex', 'FontSize', 14);
    hold off;
    min(min(plot1, plot2))
    axis([0 xArray(end) min(min(plot1, plot2)) max(max(plot1, plot2)) * 1.25]);
    
    pbaspect([3.5 1 1]);
    filename = strrep(titleString, ' ', '_');
    filepath = strcat('../Common/figures/', prefix, '_', filename);
    savefig(fig, strcat(filepath, '.fig'));
    saveas(fig, filepath, 'epsc');
    %close(fig);
end