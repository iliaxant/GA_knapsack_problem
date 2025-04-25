function parents = ksack_selection(scores, nParents, options)

% Roulette based selection (no Infs present)

fitness = scores;

prob = 1 ./ fitness;
prob = prob ./ sum(prob);  
cdf = cumsum(prob);

parents = zeros(1, nParents);

for i = 1:nParents
    
    idx = find(cdf >= rand, 1, 'first');
    parents(i) = idx;

end




% % Ranking selection
% 
% [~, sorted_ind] = sort(scores);
% 
% parents = sorted_ind(1:nParents)';




% % Roulette based selection (Infs are present)
% 
% fitness = scores;
% 
% valid = ~isinf(fitness);
% prob = zeros(size(fitness));
% prob(valid) = 1 ./ fitness(valid);
% prob = prob ./ sum(prob);  
% cdf = cumsum(prob);
% 
% parents = zeros(1, nParents);
% 
% for i = 1:nParents
%     idx = find(cdf >= rand, 1, 'first');
%     parents(i) = idx;
% 
% %     % Kill selected chromosome
% %     prob(idx) = 0;
% % 
% %     % Recalculate CDF for next pick
% %     prob = prob ./ sum(prob);
% %     cdf = cumsum(prob);
% 
% end




% % Propabilty of breeding (Infs are present)
%
% fitness = scores;
% 
% valid = ~isinf(fitness);
% prob = zeros(size(fitness));
% prob(valid) = 1 ./ fitness(valid);
% prob = prob ./ sum(prob);  % Normalize
% prob
% sum(prob)
% parents = [];
% ind = 1;
% for i = 1:length(fitness)
%     if rand < prob(i)
%         parents(ind) = i;
%         ind = ind + 1;
%     end
% end    




end

