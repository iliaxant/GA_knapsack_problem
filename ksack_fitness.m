function scores = ksack_fitness(x, weights, values, max_weight, max_value) 

% (BEST SO FAR) 1st method of overweight & underweight penalty (value and weight)

over_penalty = 100;
under_penalty = 10;

total_weights = x * weights;
total_values = x * values;

overweight = total_weights - max_weight;

is_overweight= overweight > 0;
is_underweight = overweight < 0;
is_perfect = overweight == 0;

scores = (is_perfect) + abs(overweight) .* ( is_overweight * over_penalty + ...
    is_underweight * under_penalty);
scores = scores ./ total_values;




% % 2nd method of overweight & underweight penalty (value and weight)
% 
% over_penalty = 100;
% under_penalty = 10;
% 
% total_weights = x * weights;
% total_values = x * values;
% 
% overweight = total_weights - max_weight;
% 
% is_overweight= overweight > 0;
% is_underweight = overweight < 0;
% 
% scores = total_weights ./ total_values;
% scores(is_overweight) = over_penalty * scores(is_overweight) .* ...
%     overweight(is_overweight);
% scores(is_underweight) = - under_penalty * scores(is_underweight) .* ...
%     overweight(is_underweight);




% % Overweight penalty and rejection (set score to Inf) (Only value)
% 
% tol = 25;       
% penalty = 1e6;
% 
% total_weights = x * weights;
% total_values = x * values;
% 
% overweight = total_weights - max_weight;
% 
% is_mild = overweight > 0 & overweight <= tol;
% is_severe = overweight > tol;
% 
% scores = (max_value - total_values);
% scores(is_mild) = scores(is_mild) + penalty .* overweight(is_mild);
% scores(is_severe) = Inf;




% % Overweight Penalty (Only value)
% 
% penalty = 1e4;
% 
% total_weights = x * weights;
% total_values = x * values;
% 
% overweight = total_weights - max_weight;
% 
% is_overweight= overweight > 0;
% 
% scores = (max_value - total_values);
% scores(is_overweight) = scores(is_overweight) + penalty .* ....
%     overweight(is_overweight);




% % Overweight Penalty (value and weight)
% 
% penalty = 100;
% 
% total_weights = x * weights;
% total_values = x * values;
% 
% overweight = total_weights - max_weight;
% 
% is_overweight = overweight > 0;
% 
% scores = total_weights ./ total_values;
% scores(is_overweight) = penalty * scores(is_overweight) .* ...
%     overweight(is_overweight);




% % Overweight penalty and heavier penalty (Only value)
%
% tol = 25;
% penalty = 1e4;
% penalty_mult = 10;
% 
% total_weights = x * weights;
% total_values = x * values;
% 
% overweight = total_weights - max_weight;
% 
% is_mild = overweight > 0 & overweight <= tol;
% is_severe = overweight > tol;
% 
% scores = (max_value - total_values);
% scores(is_mild) = scores(is_mild) + penalty .* overweight(is_mild);
% scores(is_severe) = scores(is_severe) + penalty * penalty_mult .* ...
%     overweight(is_severe);




end


