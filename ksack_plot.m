function state = ksack_plot(options, state, flag, maxGen)

persistent best_chrom g_best g_avg g_worst start_time; 

if strcmp(flag, 'iter')
    
    scores = state.Score;
    gen = state.Generation;
    
    [best, best_idx] = min(scores);

    best_chrom(gen,:) = state.Population(best_idx,:);
    worst = max(scores);
    avg = mean(scores);
    
    elapsed_time = toc(start_time);
    minutes = floor(elapsed_time / 60);
    seconds = mod(elapsed_time, 60);
    time_str = sprintf('%d:%05.2f', minutes, seconds);
    
    title(sprintf('Fitness Values per Generation (%d / %d) | Elapsed Time: %s', ...
        state.Generation, maxGen, time_str), 'FontSize', 14);
    
    addpoints(g_best, gen, best);
    addpoints(g_avg, gen, avg);
    addpoints(g_worst, gen, worst);
    
    drawnow;

elseif strcmp(flag, 'init')
    
    best_chrom = zeros(maxGen, size(state.Population,2));    

    figure(1);
    set(gcf, 'Position', [150, 100, 1200, 600]);
    hold on;
    
    g_best = animatedline('Color', 'g', 'LineWidth', 2, 'DisplayName', 'Best');
    g_avg  = animatedline('Color', 'b', 'LineWidth', 2, 'DisplayName', 'Average');
    g_worst= animatedline('Color', 'r', 'LineWidth', 2, 'DisplayName', 'Worst');
    
    legend show;
    xlabel('Generation', 'FontSize', 12);
    ylabel('Score', 'FontSize', 12);
    xlim([0 maxGen]);
    ylim([0 5]);
    grid on;
   
    start_time = tic;
    
elseif strcmp(flag, 'done') || strcmp(flag, 'interrupt')
    
    elapsed_time = toc(start_time);
    minutes = floor(elapsed_time / 60);
    seconds = mod(elapsed_time, 60);
    time_str = sprintf('%d:%05.2f', minutes, seconds);
    
    fprintf('Total execution time: %s.\n', time_str);
    
    hold off;
    
    figure(2);
    set(gcf, 'Position', [150, 100, 1200, 600]);
    
    imagesc(best_chrom);  
    colormap([1 1 1; 0 0.5 1]); % White for 0, Blue for 1
    colorbar;
    
    cb = colorbar;
    cb.Ticks = [0, 1];
    cb.TickLabels = {'0', '1'};

    title(sprintf('Best Chromosome History (%d / %d) | Elapsed Time: %s', ...
        state.Generation, maxGen, time_str), 'FontSize', 14);
    
    
    id_labels = size(best_chrom, 2);
    xticks(1:id_labels);
%     xtickangle(45); 
    axis = gca;
    axis.XAxis.FontSize = 8;
    xlabel('Item Id', 'FontSize', 12);
    
%     yticks(0:20:maxGen);
% %     ytickangle(45);
%     axis.YAxis.FontSize = 8;
    ylabel('Generation', 'FontSize', 12);
    
    grid on;
    
    clear best_chrom g_best g_avg g_worst start_time;
    
end

end

