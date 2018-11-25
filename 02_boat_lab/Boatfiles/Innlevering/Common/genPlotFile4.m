function [] = genPlotFile4(prefix, titleString, xLabel, yLabel, xArray1, plot1, plot2, xArray2, plot3, plot4, plot1Legend, plot2Legend, plot3Legend, plot4Legend)
    fig = figure;
    title(titleString);
    grid on;
    ylabel(yLabel);
    xlabel(xLabel);
    hold on;
    plot(xArray1, plot1, 'm'); 
    plot(xArray1, plot2, 'r');
    plot(xArray2, plot3, 'c');
    plot(xArray2, plot4, 'b');
    
    legend({plot1Legend, plot2Legend, plot3Legend, plot4Legend}, 'Location','southeast', 'Interpreter', 'Latex', 'FontSize', 14);
    hold off;
    axis([0 xArray1(end) min(min(min([plot1 plot2])), min(min([plot3 plot4]))) max(max(max([plot1 plot2])), max(max([plot3 plot4]))) * 1.25]);
    
    pbaspect([3.5 1 1]);
    filename = strrep(titleString, ' ', '_');
    filepath = strcat('../Common/figures/', prefix, '_', filename);
    savefig(fig, strcat(filepath, '.fig'));
    saveas(fig, filepath, 'epsc');
    %close(fig);
end