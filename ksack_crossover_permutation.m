function xoverKids  = ksack_crossover_permutation(parents, options, NVARS, ... 
    FitnessFcn, thisScore, thisPopulation) 

% BEST SO FAR: Method: Parents == 2 * Kids == 2 * population

n = NVARS;
nKids = length(parents)/2;

xoverKids = zeros(nKids, n);

index = 1;
for i=1:nKids 
     
    parent_1 = thisPopulation(parents(index),:);
    parent_2 = thisPopulation(parents(index+1),:);
    index = index + 2; 
 
    point = randi(n);
    child = [parent_1(1:point), parent_2(point+1:end)];
    
    xoverKids(i,:) = child;
    
end




% %  Region Crossover
%
% n = NVARS;
% nKids = length(parents)/2;
% 
% xoverKids = zeros(nKids, n);
% 
% index = 1;
% for i=1:nKids 
%      
%     parent_1 = thisPopulation(parents(index),:);
%     parent_2 = thisPopulation(parents(index+1),:);
%     index = index + 2; 
%  
%     points = sort(randi([0,n],1,2));
%     point1=points(1);
%     point2=points(2);
%     child = [parent_1(1:point1), parent_2(point1+1:point2), ...
%         parent_1(point2+1:end)];
%     
%     xoverKids(i,:) = child;
%     
% end




% % % (REJECTED, NOT HOW OPTIMOPTIONS WORKS) Method: Parents == Kids == 2 * population
% 
% n = NVARS;
% nParents = length(parents);
% nKids = nParents;
% 
% xoverKids = zeros(nKids, n);
% % global descendants;
% 
% index = 1;
% for i = 1:2:nParents
% 
%     if i+1 > nParents
%         xoverKids(index,:) = thisPopulation(parents(i), :);
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
%     xoverKids(index, :) = child1;
%     xoverKids(index+1, :) = child2;
%     index = index + 2;
% 
% end
% 
% % descendants = xoverKids;
% % xoverKids = [];




end
