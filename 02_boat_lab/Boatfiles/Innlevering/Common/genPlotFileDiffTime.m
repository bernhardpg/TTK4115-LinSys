function [] = genPlotFileDiffTime(prefix, titleString, xLabel, yLabel, xArray1, plot1, xArray2, plot2, plot1Legend, plot2Legend)
    fig = figure;
    title(titleString);
    grid on;
    ylabel(yLabel);
    xlabel(xLabel);
    hold on;
    plot(xArray1, plot1, 'b');
   
    plot(xArray2, plot2, 'r');
    
    legend({plot1Legend, plot2Legend}, 'Location','southeast', 'Interpreter', 'Latex', 'FontSize', 14);
    hold off;
    axis([0 xArray1(end) min(min(min(plot1),min(plot2))) max(max(max(plot1), max(plot2))) * 1.25]);
    
    pbaspect([3.5 1 1]);
    filename = strrep(titleString, ' ', '_');
    filepath = strcat('../Common/figures/', prefix, '_', filename);
    savefig(fig, strcat(filepath, '.fig'));
    saveas(fig, filepath, 'epsc');
    %close(fig);
end