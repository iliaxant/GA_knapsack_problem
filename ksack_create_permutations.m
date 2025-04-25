function pop = ksack_create_permutations(NVARS, FitnessFcn, weights, ...
    max_weight, options)

% BEST SO FAR: Completely random initiation 

totalPopulationSize = sum(options.PopulationSize);

n = NVARS; 

pop = round(rand(totalPopulationSize,n));




% % Random initiation just below max_weight (Greedy)
%
% totalPopulationSize = sum(options.PopulationSize);
% n = NVARS;
% pop = zeros(totalPopulationSize, n);
% 
% for i = 1:totalPopulationSize
%     chrom = zeros(1, n);
%     item_order = randperm(n);  % Shuffle items to randomize selection order
%     total_weight = 0;
% 
%     for j = 1:n
%         idx = item_order(j);
%         if total_weight + weights(idx) <= max_weight
%             chrom(idx) = 1;
%             total_weight = total_weight + weights(idx);
%         end
%     end
% 
%     pop(i,:) = chrom;
% end




% % Hybrid method (half random, half greedy)
%
% totalPopulationSize = sum(options.PopulationSize);
% n = NVARS;
% 
% half = floor(totalPopulationSize / 2);
% pop = zeros(totalPopulationSize, n);
% 
% pop(1:half,:) = round(rand(half,n));
% 
% for i = half+1:totalPopulationSize
%     chrom = zeros(1, n);
%     item_order = randperm(n);  % Shuffle items to randomize selection order
%     total_weight = 0;
% 
%     for j = 1:n
%         idx = item_order(j);
%         if total_weight + weights(idx) <= max_weight
%             chrom(idx) = 1;
%             total_weight = total_weight + weights(idx);
%         end
%     end
%     pop(i,:) = chrom;
% end




% % Half random / Half ranging underweight
% 
% totalPopulationSize = sum(options.PopulationSize);
% n = NVARS;
% 
% half = floor(totalPopulationSize / 2);
% pop = zeros(totalPopulationSize, n);
% 
% pop(1:half,:) = round(rand(half,n));
% 
% for i = half+1:totalPopulationSize
%     
%     item_order = randperm(n);  % Shuffle items to randomize selection order
%     item_chosen = randi(3);
%     
%     pop(i,item_order(1:item_chosen)) = 1;
%     
% end




% % All random underweight
% 
% totalPopulationSize = sum(options.PopulationSize);
% n = NVARS;
% 
% pop = zeros(totalPopulationSize, n);
% for i = 1:totalPopulationSize
%     
%     item_order = randperm(n);  % Shuffle items to randomize selection order
%     item_chosen = randi(2);
%     
%     pop(i,item_order(1:item_chosen)) = 1;
%     
% end




end