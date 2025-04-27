%% 1) Data extraction and initiations
% Read knapsack.xls and extract data. Initiate random number generator and
% variables. Print "Problem Specifications".

clear;
clc;
rng();  % Leave blank for random-seed

data = xlsread('knapsack.xls');

ids = data(5:end, 1); % Not necessary
weights = data(5:end, 2);
values = data(5:end, 3);

max_weight = data(1, 3); % == 27
max_value = sum(values);  % == 34965
numberOfVariables = data(2,3); % Total items (== 100)

fprintf('------- Problem Specifications -------\n\n');

fprintf('Total items: %d\n', numberOfVariables);
fprintf("Knapsack's weight limit: %d\n\n", max_weight);

fprintf('Total weight of items: %d\n', max_weight);
fprintf('Mean weight of items: %.2f\n', (mean(weights)));
fprintf('Weight range of items: [%d,%d]\n\n', min(weights),max(weights));

fprintf('Total value of items: %d\n', max_value);
fprintf('Mean value of items: %.2f\n', (mean(values)));
fprintf('Value range of items: [%d,%d]\n\n', min(values),max(values));

fprintf('--------------------------------------\n\n')

%% 2) Genetic Algorithm setup
% Setup the GA functions and parameters.

% ---------------- User input (GA configs) -----------------
population_size = 100;          % Recommended: 100
elite_count = 15;               % Recommended: 15
crossover_fraction = 0.2;       % Recommended: 0.2
mutation_rate = 0.05;           % Recommended: 0.05
maxGen = 15000;                 % Recommended: 15000 (max time of: ~4:13.61, ~15secs per 1000 gens)
max_stall_generations = 5000;   % Recommended: 5000
function_tolerance = 1e-10;     % Recommended: 1e-10
% ----------------------------------------------------------


% ------------ Functions with custom parameters ------------
FitnessFcn = @(x) ksack_fitness(x, weights, values, max_weight, max_value);

CreateFcn = @(NVARS, FitnessFcn, options) ksack_create_permutations(NVARS,... 
    FitnessFcn, weights, max_weight, options);

MutateFcn = @(parents, options, NVARS, FitnessFcn, state, thisScore, ...
    thisPopulation) ksack_mutate_permutation(parents, options, NVARS, ... 
    FitnessFcn, state, thisScore, thisPopulation, mutation_rate);

GraphFcn = @(options, state, flag) ksack_plot(options, state, flag, maxGen);
% ---------------------------------------------------------


options = optimoptions('ga', ...
    'PopulationType', 'bitstring', ...
    'CreationFcn', CreateFcn, ...
    'SelectionFcn', @ksack_selection, ...
    'CrossoverFcn', @ksack_crossover_permutation, ...
    'CrossoverFraction', crossover_fraction, ...
    'MutationFcn', MutateFcn, ...
    'EliteCount', elite_count, ...
    'PlotFcn', GraphFcn, ...
    'MaxGenerations', maxGen, ...
    'PopulationSize', population_size, ... 
    'MaxStallGenerations', max_stall_generations, ...
    'FunctionTolerance', function_tolerance, ...
    'UseVectorized', true);

fprintf('Genetic Algorithm was setup successfully.\n\n');

%% 3)Genetic Algorithm execution and details.
% Run the GA and print Run details.

[x, fval, exitflag, output, population, scores] = ga(FitnessFcn, ...
    numberOfVariables, options);

fprintf('\n------------- GA Details -------------\n\n');

fprintf('Optimal Chromosome: %s\n', mat2str(x));
fprintf('Total Generations: %d\n', output.generations);
fprintf('Termination flag: %d\n', exitflag);
fprintf('Termination message: %s\n\n', output.message);

fprintf('--------------------------------------\n\n');

%% 4)Optimal Solution Details
% Print the specifics of the computed solution.

final_weight = x * weights;
final_value = x * values;
final_ids = find(x);

fprintf('\n---------- Optimal Solution ----------\n\n');

fprintf('Selected Items: %s\n', mat2str(final_ids));
fprintf('Weight of selected items: %s\n', mat2str(weights(final_ids)'));
fprintf('Value of selected items: %s\n\n', mat2str(values(final_ids)'));

fprintf('Total Weight: %d / %d\n', final_weight, max_weight);
fprintf('Total Value: %d\n\n', final_value);

fprintf('--------------------------------------\n\n');
