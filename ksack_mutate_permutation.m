function mutationChildren = ksack_mutate_permutation(parents, options, NVARS, ... 
    FitnessFcn, state, thisScore, thisPopulation, mutationRate) 

% Mutation using parents (Random Mutation to everyone) 

mutationChildren = thisPopulation(parents,:);

mutants = rand(size(mutationChildren));
mutationChildren(mutants < mutationRate) = 1 - ...
    mutationChildren(mutants < mutationRate);




% % Crossover and mutations (Set CrossoverFraction = 0.0):
% 
% 
% n = NVARS;
% nParents = length(parents);
% nKids = nParents;
% 
% mutationChildren = zeros(nKids, n);
% 
% index = 1;
% for i = 1:2:nParents
% 
%     if i+1 > nParents
%         mutationChildren(index,:) = thisPopulation(parents(i), :);
%         break;
%     end
% 
%     parent_1 = thisPopulation(parents(i), :);
%     parent_2 = thisPopulation(parents(i+1), :);
% 
%     point = randi(n);
%     child1 = [parent_1(1:point), parent_2(point+1:end)];
%     child2 = [parent_2(1:point), parent_1(point+1:end)];
% 
%     mutationChildren(index, :) = child1;
%     mutationChildren(index+1, :) = child2;
%     index = index + 2;
% 
% end
% 
% mutants = rand(size(mutationChildren));
% mutationChildren(mutants < mutationRate) = 1 - ...
%     mutationChildren(mutants < mutationRate);




% % Mutation using decendants (1 bit mutation to some)
%
% global descendants;
% 
% mutationChildren = descendants;
% 
% for i = 1:size(descendants,1)
%     if rand < mutationRate
%         point = randi(NVARS);
%         mutationChildren(i, point) = 1 - mutationChildren(i, point);
%     end
% end




% % Mutation using parents (1 bit mutation to some)
% 
% mutationChildren = thisPopulation(parents,:);
% 
% for i = 1:length(parents)
%     if rand < mutationRate
%         point = randi(NVARS);
%         mutationChildren(i, point) = 1 - mutationChildren(i, point);
%     end
% end




% % Mutation using decendants (Random Mutation to everyone)
% 
% global descendants;
% 
% mutationChildren = descendants;
% 
% mutants = rand(size(mutationChildren));
% mutationChildren(mutants < mutationRate) = 1 - ...
%     mutationChildren(mutants < mutationRate);




end