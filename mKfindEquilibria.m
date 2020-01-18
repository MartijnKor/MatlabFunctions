function [equilibria] = mKfindEquilibria(xdot)
% This function finds all the equilibria for the (non)linear system in the
% input array xdot, where xdot is the state space representation of the
% system.
%
% Input: xdot (nx1) is the state space representation of the system using
% symbolic variables.
% Output: The output is an nxm vector representing the equilibria in each
% column as a seperate equilibrium, where m is the amount of found equilibria.

    %% Check whether xdot is [n,1].
    if length(xdot(1,:)) ~= 1
        error('xdot is not an nx1 matrix')
    end

    %% Create the equation array.
    eqn = [];
    for i = 1:length(xdot)
        eqn = [eqn; xdot(i) == 0]
    end
    
    %% Solve the equations.
    solutions = solve(eqn);
    variables = fieldnames(solutions);
    first_variable = variables{1};
    
%     equilibria = zeros(length(solutions.(first_variable)), length(xdot));
    equilibria = zeros(length(xdot), length(solutions.(first_variable)));
    for i = 1:length(xdot)
        column = double(solutions.(variables{i}));
        equilibria(i,:) = column;
    end
end